include ActionView::Helpers::NumberHelper
class VoiceTalentUser < ActiveRecord::Base
  has_many :tasks

  scope :actives, -> {where(is_active: true)}

  validates :first_name, :presence => true, :length => { :minimum => 1, :maximum => 255 }
  validates :last_name, :presence => true, :length => { :minimum => 1, :maximum => 255 }
  ## Unique
  ## Solo letras y numeros
  validates :nickname, :presence => true, :length => { :minimum => 1, :maximum => 255 }
  ## Unique
  validates :email, :presence => true, :length => { :in => 6..255 }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :full_rate, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :rush_full_rate, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :partial_rate, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :rush_partial_rate, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :correction_rate, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def to_s
    return id.to_s + ':' + first_name.to_s + ':' + last_name.to_s + ':' + nickname.to_s + ':' + is_veteran.to_s + ':' + email.to_s + ':' + format_number(full_rate) + ':' + format_number(rush_full_rate) + ':' + format_number(partial_rate) + ':' + format_number(rush_partial_rate) + ':' + format_number(correction_rate)
  end

  private
    def format_number item
      number_to_currency(item, unit: '', precision: 0).to_s
    end

end
