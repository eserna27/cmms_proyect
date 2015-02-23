class Hospital < ActiveRecord::Base
	belongs_to :account
	has_many :users
	has_many :equipments
	has_many :areas
	has_many :contacts
end
