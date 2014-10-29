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
      format.json { render json: { :voice_talent_user => vt } , content_type: 'text/json' }
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
    @task.acknowledged!
    ContentMailer.acknowledged_email(@task).deliver

    @task.events.create(event_type: 4, feedback: "Sent email to Content Ops for acknowledge")

    respond_to do |format|
      flash[:notice] = "Voice Request ##{@task.id} was confirmed!"
      vt = @task.voice_talent_user
      format.html {redirect_to "/dashboard/#{vt.nickname}/#{vt.digest}" }
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
    @user = @task.voice_talent_user

    @task.events.create([{event_type: 0, feedback: "Voice request created"},
                         {event_type: 1, feedback: hash }])

    file = params[:task][:file]
    self.add_assets(file, false)


    respond_to do |format|
      if @task.save

        url = "http://localhost:10534/confirm/#{hash}"

        VoicetalentMailer.new_request_email(@task, @user, url).deliver
        ContentMailer.new_request_email(@task, @user).deliver
        @task.events.create([{event_type: 2, feedback: "Email sent to Voice Talent: #{ @user.email }"},
                             {event_type: 3, feedback: "Email sent to Content Ops: #{@task.content_ops.email}"}])

        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
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
      @task.finished!

      if @task.update(task_params)
        @task.events.create([{event_type: 5, feedback: "Uploaded file: #{file}"},
                             {event_type: 6, feedback: "Email sent to Content Ops notifing the upload: #{@task.content_ops.email}"}])
        ContentMailer.file_uploaded_email(@task).deliver

        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
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

    def get_hash
      # Get the Task where status is notacknowledged and the event is the given parameter
      @task = Task.joins(:events).where(status: Task.statuses[:notacknowledged],
                                        events:{ event_type: 1,
                                                 feedback: params[:hash] }).take or not_found('Confirmation not found')
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
                                   :status, :file, :rate)
    end
end
