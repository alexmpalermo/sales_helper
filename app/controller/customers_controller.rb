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
    if logged_in?
    @customer = Customer.find_by_slug(params[:slug])
  
    erb :"/customers/show.html"
  else 
    redirect to "/login"
  end 
  end 
  
  get '/customers/:slug/edit' do 
    if logged_in?
    @customer = Customer.find_by_slug(params[:slug])
    erb :"/customers/edit.html"
  else 
    redirect to "/login"
  end 
  end 
  
  post '/customers' do 
    @customer = Customer.create(params[:customer])
    @customer.representative = current_user
    @date = Date.today.to_formatted_s(:long)
    
    params[:items].each do |details|
    
      if details[:name] != "" && details[:quantity] != ""
        @item = Item.create(details)
        @item.date = @date 
        @customer.items << @item 
        @customer.save 
      end 
      end
    redirect to "/customers/#{@customer.slug}"
    
  end 
  
  patch '/customers/:slug' do 
    @customer = Customer.find_by_slug(params[:slug])
    if params[:customer][:name] != "" 
    @customer.update(name: params[:customer][:name])
  end 
    if params[:customer][:contact] != ""
      @customer.update(contact: params[:customer][:contact])
    end 
    @date = Date.today.to_formatted_s(:long)
      @customer.items.each do |item|
      if params["#{item.id}"] != ""
      item.update(quantity: params["#{item.id}"], date: @date)
    end 
  end 
    params[:items].each do |details|
      if details[:name] != "" && details[:quantity] != ""
        @item = Item.create(details)
        @item.date = @date 
        @customer.items << @item 
        @customer.save 
      end 
    end 
      redirect to "/customers/#{@customer.slug}"
  end 
  
  delete '/customers/:slug/delete' do 
   if logged_in?
    @customer = Customer.find_by_slug(params[:slug])
    @representative = Representative.find_by_id(@customer.representative_id)
    if @representative == current_user 
    @customer.destroy
  end
    redirect to "/representatives/#{@representative.slug}"
  end 
  end
end