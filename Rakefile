require_relative './config/environment'

require 'sinatra/activerecord/rake'

desc 'A console'
task :console do 
  Pry.start 
end 

require "bundler/gem_tasks"
task :default => :spec
