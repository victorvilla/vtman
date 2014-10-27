class Task < ActiveRecord::Base
  
  # mount_uploader :file, 
  
  belongs_to :client
  belongs_to :writer, :class_name => 'GuidesparkUser'
  belongs_to :content_ops, :class_name => 'GuidesparkUser'
  belongs_to :voice_talent_user
  has_many :assets, dependent: :destroy
  
  enum status: { notacknowledged: 0, acknowledged: 1, wip: 2, finished: 3, done: 4, overdue: 5 }
  enum type_script: {full: 0, partial: 1, correction: 2}
  
  
  validates :video_title, :presence => true, :length => { :minimum => 1, :maximum => 100 }
  validates :number_chapters, numericality: { only_integer: true, greater_than_or_equal_to: 1 } #less_than_or_equal_to: 99  ???
  validates :notes, :length => { :minimum => 0, :maximum => 250 }
  validates :rate, numericality: true
end
