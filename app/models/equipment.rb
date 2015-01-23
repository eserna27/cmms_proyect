class Equipment < ActiveRecord::Base
	has_one :equipment_type
	belongs_to :hospital
end
