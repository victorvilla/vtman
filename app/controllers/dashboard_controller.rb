class DashboardController < ApplicationController
  before_action :get_hash

  decorates_assigned :tasks

  def index
    @tasks = Task.includes(:scripts, :uploads, :client, :voice_talent_user).where(voice_talent_user_id: @user.id) unless @user.nil?
  end

  private

  def get_hash
    @user = VoiceTalentUser.find_by(nickname: params[:voicetalent], digest: params[:digest])

  end
end
