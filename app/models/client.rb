class Client < ActiveRecord::Base
  has_many :tasks
  
  scope :actives, -> {where(is_active: 1)}
end
