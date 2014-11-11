
class GuidesparkUser < ActiveRecord::Base
  has_many :tasks
  
  scope :actives, -> {where(is_active: 1)}
  
  scope :active_voice_request_alias, -> {actives.where(profile: 1)}
  
  scope :active_writers, -> {actives.where(profile: 2)}
  has_secure_password
end
