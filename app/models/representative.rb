class Representative < ActiveRecord::Base 
  has_secure_password 
  has_many :customers 
end 