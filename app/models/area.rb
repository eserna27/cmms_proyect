class Area < ActiveRecord::Base
	has_many :subareas
	belongs_to :hospital
	has_one :contact
end
