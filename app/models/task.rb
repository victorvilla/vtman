class Task < ActiveRecord::Base
  belongs_to :client
  belongs_to :guidesparkUser
  belongs_to :voiceTalentUser
end
