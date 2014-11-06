class Asset < ActiveRecord::Base
  mount_uploader :file, ScriptUploader
  belongs_to :task
  enum asset_type: { script: 0, audio: 1 }
  enum status: { active: 0, archived: 1 }

  @@info = { script: { whitelist: %w(pdf doc docx txt),
                       folder: "scripts"},
             audio:  { whitelist: %w(wav mp3 mp4 zip),
                       folder: "audio" } }

  def get_property(property)
    @@info[self.asset_type.to_sym][property]
  end


end
