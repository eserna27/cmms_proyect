class Account < ActiveRecord::Base
  has_one :user
  has_one :plan
  has_one :hospital
end
