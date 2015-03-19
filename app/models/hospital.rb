class Hospital < ActiveRecord::Base
	has_one :account
	has_many :users
	has_many :equipments
	has_many :areas
	has_many :contacts
end
