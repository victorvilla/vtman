class Event < ActiveRecord::Base
  belongs_to :task

  enum event_type: {
    hash_code: 0,
    task_created: 1,
    notack_voice_notification: 2,
    notack_cops_notification: 3,
    ack_cops_notification: 4,
    file_uploaded: 5,
    upload_cops_notification: 6  }
end
