class Task < ActiveRecord::Base
  belongs_to :client
  belongs_to :writer, :class_name => 'GuidesparkUser'
  belongs_to :content_ops, :class_name => 'GuidesparkUser'
  belongs_to :voice_talent_user
  has_many :assets, dependent: :destroy
  has_many :scripts, -> { where({:asset_type => 0}) }, :class_name => "Asset"
  has_many :uploads, -> { where({:asset_type => 1}) }, :class_name => "Asset"
  has_many :events, dependent: :destroy
  enum status: { notacknowledged: 0, acknowledged: 1, wip: 2, finished: 3, done: 4, overdue: 5}
  enum type_script: {full: 0, partial: 1, correction: 2}
end
