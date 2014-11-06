class Asset < ActiveRecord::Base
  mount_uploader :file, ScriptUploader
  belongs_to :task
  enum asset_type: { script: 0, audio: 1 }
  enum status: { active: 0, archived: 1 }
end
