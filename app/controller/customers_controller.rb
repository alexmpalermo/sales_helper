class CustomersController < ApplicationController
  
  get '/customers/new' do 
    erb :"/customers/new.html"
  end
  
  get '/customers/:slug' do 
    erb :"/customers/show.html"
  end 
  
  get '/customers/:slug/edit' do 
    erb :"/customers/edit.html"
  end 
  
  post '/customers' do 
    
  end 
  
  patch '/customers/:slug' do 
    
  end 
  
  delete '/customers/:slug/delete' do 
    
  end 
end