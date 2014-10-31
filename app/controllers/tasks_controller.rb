require 'digest'

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :get_hash, only: [:confirm]
  before_action :logged_in_user, only: [:index, :new]
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.includes(:scripts, :uploads, :client, :voice_talent_user).all.decorate
  end

  # GET /tasks/new
  def new
    if iswriter?
      @task = Task.new
      @voiceTalentUsers = VoiceTalentUser.actives
    else
      flash[:danger] = "Only writers can add a New Voice Request."
      redirect_to tasks_path
    end
  end

  # GET /tasks/1/edit
  def edit
    @readonly = true
     respond_to do |format|
       format.html {render :edit}
     end
  end

  # GET /tasks/rate
  # GET /tasks/rate.json
  def rate
    respond_to do |format|
      voice_talent_user = params[:voice_talent_user_id]
      vt = VoiceTalentUser.actives.find(voice_talent_user)
      nwd = next_work_date().strftime("%m-%d-%Y")
      format.json { render json: { :voice_talent_user => vt, :next_work_date => nwd } , content_type: 'text/json' }
    end
  end

  def status
    #TODO: Secure this API
    task = Task.find_by id: params[:id]

    # If this API is paged then set the Task as WIP if their status is
    # both, Not-Acknowledged or Acknowledged since we assume
    # the script file was downloaded

    if !task.nil?
      old_status = task.status
      task.wip! if %w[notacknowledged acknowledged].include?(task.status)
      response = {id: task.id, status: old_status}
    else
      response = nil
    end
    respond_to do |format|
      format.json { render json: response, content_type: 'text/json' }
    end
  end

  def upload(file)
    uploaded_io = file
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

  def confirm
    # Set the new status to the task
    if @task
      @task.acknowledged!
      ContentMailer.acknowledged_email(@task).deliver
      @task.events.create(event_type: :ack_cops_notification, feedback: "Sent email to Content Ops for acknowledge")

      respond_to do |format|
        flash[:success] = "Voice Request ##{@task.id} was confirmed!"
        vt = @task.voice_talent_user
        format.html {redirect_to "/dashboard/#{vt.nickname}/#{vt.digest}" }
      end
    else
      flash[:danger] = "Confirmation code no longer valid"
      redirect_to root_path
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    # Change status as "not acknowledged"
    @task.notacknowledged!

    # TODO: Change the hash to something not predictable as the task.ID
    hash = Digest::MD5.hexdigest(@task.id.to_s)
    @task.events.create([{event_type: :hash_code, feedback: hash }])

    file = params[:task][:file]
    self.add_assets(file, false)

    respond_to do |format|
      if @task.save
        @task.events.create([{event_type: :task_created, feedback: "Voice request created"}])

        url = "http://localhost:10534/confirm/#{hash}"
        @user = @task.voice_talent_user

        VoicetalentMailer.new_request_email(@task, @user, url).deliver
        @task.events.create([{event_type: :notack_voice_notification, feedback: "Email sent to Voice Talent: #{ @user.email }"}])

        ContentMailer.new_request_email(@task, @user).deliver
        @task.events.create([{event_type: :notack_cops_notification, feedback: "Email sent to Content Ops: #{@task.content_ops.email}"}])

        flash[:success] = 'Task was successfully created.'
        format.html { redirect_to tasks_path }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      file = params[:task][:file]
      self.add_assets(file, params[:task][:deliverable])
      @task.events.create([{event_type: :file_uploaded, feedback: "Uploaded file: #{file}"}])
      @task.finished!

      if @task.update(task_params)
        ContentMailer.file_uploaded_email(@task).deliver
        @task.events.create([{event_type: :upload_cops_notification, feedback: "Email sent to Content Ops notifing the upload: #{@task.content_ops.email}"}])

        flash[:success] = 'Task was successfully updated.'
        format.html { redirect_to @task }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def add_assets(file, deliverable)
        self.upload(file)
        @task.assets.create([{asset_type: deliverable ? 1 : 0, file: file.original_filename,
                          title: file.original_filename}])
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def next_work_date
      next_date = Date.today + 1
      if next_date.wday == 6 then
        next_date + 2
      elsif next_date.wday == 0 then
        next_date + 1
      else
        next_date
      end
    end

    def get_hash
      # Get the Task where status is notacknowledged and the event is the given parameter
      @task = Task.joins(:events).\
                     where(status: Task.statuses[:notacknowledged],
                           events:{event_type: Event.event_types[:hash_code],
                                   feedback: params[:hash] }).take
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:voice_talent_user_id, :content_ops_id, :client_id, :video_title,
                                   :type_script, :number_chapters, :notes, :rush, :rate, :due_date,
                                   :status, :file)
    end
end
