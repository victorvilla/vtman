class GuidesparkUser < ActiveRecord::Base
  has_many :tasks
  
  scope :actives, -> {where(is_active: 1)}
  
  scope :active_content_ops, -> {actives.where(profile: 1)}
  
  scope :active_writers, -> {actives.where(profile: 2)}
  has_secure_password
end
