require_relative "../models/concerns/slugifiable.rb"

class Customer < ActiveRecord::Base 
  belongs_to :representative 
  has_many :customer_items
  has_many :items, through: :customer_items
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  
end