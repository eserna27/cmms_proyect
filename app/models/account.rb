class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan
  belongs_to :hospital
end
