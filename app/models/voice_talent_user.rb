class VoiceTalentUser < ActiveRecord::Base
  has_many :tasks

  scope :actives, -> {where(is_active: true)}
end
