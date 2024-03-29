class Task < ActiveRecord::Base

  belongs_to :client
  belongs_to :writer, :class_name => 'GuidesparkUser'
  belongs_to :content_ops, :class_name => 'GuidesparkUser'
  belongs_to :voice_talent_user
  has_many :assets, dependent: :destroy
  accepts_nested_attributes_for :assets

  has_many :scripts, -> { where({:asset_type => 0}) }, :class_name => "Asset"
  has_many :uploads, -> { where({:asset_type => 1}) }, :class_name => "Asset"
  has_many :events, dependent: :destroy

  validates :video_title, :presence => true, :length => { :minimum => 1, :maximum => 100 }
  validates :number_chapters, numericality: { only_integer: true, greater_than_or_equal_to: 1 } #less_than_or_equal_to: 99  ???
  validates :notes, :length => { :minimum => 0, :maximum => 250 }
  validates :rate, numericality: true

  enum status: {
    notacknowledged: 0,
    acknowledged: 1,
    wip: 2,
    finished: 3,
    done: 4,
    overdue: 5 }
  enum type_script: {
    full: 1,
    partial: 2,
    correction: 3 }
end
