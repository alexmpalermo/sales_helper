require_relative "../models/concerns/slugifiable.rb"

class Representative < ActiveRecord::Base 
  has_secure_password 
  has_many :customers 
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  
end 