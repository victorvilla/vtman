class ContentMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_request_email(task, user)
    @task = task.decorate
    emailto = task.content_ops.email
    @user = user
    mail(to: emailto,
         subject: "#{ task.rush ? '* Rush *' : '' } Due #{ @task.mdy } - #{ user.first_name } for #{ task.client.name }")
  end

  def acknowledged_email(task)
    @task = task.decorate
    emailto = task.content_ops.email
    @user = task.voice_talent_user

    mail(to: emailto,
         subject: "Status changed: #{ task.status } - #{ task.rush ? '* Rush *' : '' } Due #{ @task.mdy } - #{ @user.first_name } for #{ task.client.name } ")
  end

  def file_uploaded_email(task)
    @task = task.decorate
    emailto = task.content_ops.email
    @user = task.voice_talent_user

    mail(to: emailto,
         subject: "File Uploaded - #{ @user.first_name } for #{ task.client.name } ")
  end
end
