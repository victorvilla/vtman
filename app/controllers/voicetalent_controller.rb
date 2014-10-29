class VoicetalentController < ApplicationController
  before_action :get_hash

  def index
    @tasks = Task.includes(:scripts, :uploads, :client, :voice_talent_user).where(voice_talent_user_id: @user.id).decorate
  end

  private

  def get_hash
    @user = VoiceTalentUser.find_by(nickname: params[:voicetalent], digest: params[:digest])

  end
end
