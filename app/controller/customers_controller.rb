require 'date'

class CustomersController < ApplicationController
 
  
  get '/customers/new' do 
    redirect_if_not_logged_in
      erb :"/customers/new.html"
  end
  
  get '/customers/:id' do 
   redirect_if_not_logged_in
    @customer = Customer.find_by_id(params[:id])
      if @customer.representative == current_user
    erb :"/customers/show.html"
  else 
    redirect to "/login"
  end 
  end 
  
  get '/customers/:id/edit' do 
    redirect_if_not_logged_in 
    @customer = Customer.find_by_id(params[:id])
    if @customer.representative == current_user
    erb :"/customers/edit.html"
    else 
    redirect to "/login"
  end
  end 
  
  post '/customers' do 
     if params[:customer][:name] != "" &&  params[:customer][:contact] != "" 
    @customer = Customer.create(params[:customer])
  else 
    redirect to "/customers/new"
    end 
    @customer.representative = current_user
    @date = Date.today.to_formatted_s(:long)
    
    params[:items].each do |details|
    
      if details[:name] != "" && details[:quantity] != ""
        
        item = @customer.items.build(date: @date, name: details[:name], quantity: details[:quantity])
        item.save 
        
        #@item = Item.create(details)
       # @item.date = @date 
       # @customer.items << @item 
       # @customer.save
      #else 
        #redirect to "/customers/new"
      end 
      end
    redirect to "/customers/#{@customer.id}"
    
  end 
  
  patch '/customers/:id' do 
    @customer = Customer.find_by_id(params[:id])
   if !logged_in? || @customer.representative != current_user
     redirect to "/login"
   end 
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
      redirect to "/customers/#{@customer.id}"
  end 
  
  delete '/customers/:id/delete' do 
   redirect_if_not_logged_in
    @customer = Customer.find_by_id(params[:id])
    @representative = Representative.find_by_id(@customer.representative_id)
    if @representative == current_user 
    @customer.destroy
  end
    redirect to "/representatives/#{@representative.id}"
  end 
  end
