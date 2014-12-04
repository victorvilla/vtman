class VoiceTalentUsersController < ApplicationController
  before_action :logged_in_user
  before_action :set_voice_talent_user, only: [:show, :edit, :update, :destroy]

  # GET /voice_talent_users
  # GET /voice_talent_users.json
  def index
    @voice_talent_users = VoiceTalentUser.actives
    respond_to do |format|
       format.html # index.html.erb
       format.json { render json: VoicetalentsDatatable.new(view_context) }
    end
  end

  # GET /voice_talent_users/1
  # GET /voice_talent_users/1.json
  def show
  end

  # GET /voice_talent_users/new
  def new
    @voice_talent_user = VoiceTalentUser.new
  end

  # GET /voice_talent_users/1/edit
  def edit
    respond_to do |format|
      format.html
      # format.json { render template: "edit.html.erb" }
    end
  end

  # POST /voice_talent_users
  # POST /voice_talent_users.json
  def create
    @voice_talent_user = VoiceTalentUser.new(voice_talent_user_params)

    respond_to do |format|
      if @voice_talent_user.save
        format.html { redirect_to voice_talent_users_url, notice: 'Voice talent user was successfully created.' }
        format.json { render :show, status: :created, location: @voice_talent_user }
      else
        format.html { render :new }
        format.json { render json: @voice_talent_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voice_talent_users/1
  # PATCH/PUT /voice_talent_users/1.json
  def update
    respond_to do |format|
      if @voice_talent_user.update(voice_talent_user_params)
        format.html { redirect_to voice_talent_users_url, notice: 'Voice talent user was successfully updated.' }
        format.json { render :show, status: :ok, location: @voice_talent_user }
      else
        format.html { render :edit }
        format.json { render json: @voice_talent_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voice_talent_users/1
  # DELETE /voice_talent_users/1.json
  def destroy
    @voice_talent_user.destroy
    respond_to do |format|
      format.html { redirect_to voice_talent_users_url, notice: 'Voice talent user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voice_talent_user
      @voice_talent_user = VoiceTalentUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voice_talent_user_params
      params.require(:voice_talent_user).permit(:first_name, :last_name, :nickname, :email,
             :is_veteran, :full_rate, :rush_full_rate, :rush_partial_rate, :partial_rate, :correction_rate)
    end
end
