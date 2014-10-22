class Task < ActiveRecord::Base
	has_many :assets, dependent: :destroy
end
