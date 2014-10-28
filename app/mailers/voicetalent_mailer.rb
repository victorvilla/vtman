class VoicetalentMailer < ActionMailer::Base

  def new_request_email(task, user, url)
    @task = task.decorate
    @user = user
    @url  = url
    mail(to: @user.email,
         subject: "#{ task.rush ? '* Rush *' : '' } Due #{ @task.mdy } - #{ user.first_name } for #{ task.client.name }")
  end
end
