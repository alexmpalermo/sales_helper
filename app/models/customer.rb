require_relative "../models/concerns/slugifiable.rb"

class Customer < ActiveRecord::Base 
  belongs_to :representative 
  has_many :items
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  
end