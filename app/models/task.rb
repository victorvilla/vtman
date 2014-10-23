class Task < ActiveRecord::Base
  belongs_to :client
  belongs_to :guidespark_user
  belongs_to :voice_talent_user
  has_many :assets, dependent: :destroy
  enum status: { notacknowledged: 0, acknowledged: 1, wip: 2, finished: 3, done: 4, overdue: 5}
  enum type_script: {full: 0, partial: 1, correction: 2}
end
