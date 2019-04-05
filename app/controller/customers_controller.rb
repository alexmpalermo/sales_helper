class CustomersController < ApplicationController
  
  get '/customers/new' do 
    erb :"customers/new.html"
  end
  
  
end