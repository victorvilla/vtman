class ContentMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_request_email(task, user, url)
    @task = task.decorate
    @user = user
    @url  = url
    mail(to: @user.email,
         subject: "#{ task.rush ? '* Rush *' : '' } Due #{ @task.mdy } - #{ user.first_name } for #{ task.client.name }")
  end

  def acknowledged_email(task)
    @task = task.decorate
    @user = task.content_ops

    mail(to: @user.email,
         subject: "Status changed: #{ task.status } - #{ task.rush ? '* Rush *' : '' } Due #{ @task.mdy } - #{ @user.first_name } for #{ task.client.name } ")
  end
end
