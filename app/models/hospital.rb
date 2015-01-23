class Hospital < ActiveRecord::Base
	has_many :users
	has_many :equipments
	has_many :areas
end
