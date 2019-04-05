class CustomerItem < ActiveRecord::Base 
  belongs_to :customer 
  belongs_to :item 
end