class CustomersController < ApplicationController
 
  
  get '/customers/new' do 
    if logged_in?
    erb :"/customers/new.html"
  else 
    redirect to "/"
  end 
  end
  
  get '/customers/:slug' do 
    erb :"/customers/show.html"
  end 
  
  get '/customers/:slug/edit' do 
    erb :"/customers/edit.html"
  end 
  
  post '/customers' do 
    @customer = Customer.create(name: params[:name], contact: params[:contact])
    @customer.representative = current_user
    
    @customer.save
    
    redirect to "/customers/#{@customer.slug}"
  end 
  
  patch '/customers/:slug' do 
    
  end 
  
  delete '/customers/:slug/delete' do 
    
  end 
end