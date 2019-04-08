require 'date'

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
    @customer = Customer.create(params[:customer])
    @customer.representative = current_user
    @date = Date.today.to_formatted_s(:long)
    
    params[:customer][:items].each do |details|
        @item = Item.create(details)
        @item.date = @date 
        @customer.items << @item 
      end
      
    
    
    @customer.save
    
    redirect to "/customers/#{@customer.slug}"
  end 
  
  patch '/customers/:slug' do 
    
  end 
  
  delete '/customers/:slug/delete' do 
    
  end 
end