class Task < ActiveRecord::Base
  belongs_to :client
  belongs_to :guidespark_user
  belongs_to :voice_talent_user
end
