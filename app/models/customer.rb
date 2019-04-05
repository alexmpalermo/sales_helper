class Customer < ActiveRecord::Base 
  belongs_to :representative 
  has_many :customer_items
  has_many :items, through: :customer_items
end