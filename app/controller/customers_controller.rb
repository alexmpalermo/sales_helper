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
    @items = []
    @items << Item.create(name: "Gloves", quantity: params["gloves"])
    @items << Item.create(name: "Masks", quantity: params["masks"])
    @items << Item.create(name: "Gauze", quantity: params["gauze"])
    @items << Item.create(name: "Lidocaine", quantity: params["lidocaine"])
    @items << Item.create(name: "Benzocaine Gel", quantity: params["gel"])
    @items << Item.create(name: "Autoclaves", quantity: params["autoclaves"])
    @items << Item.create(name: "Sterilization Pouches", quantity: params["pouches"])
    @items << Item.create(name: "Wipes", quantity: params["wipes"])
    @customer.items = @items
    @customer.save
    
    redirect to "/customers/#{@customer.slug}"
  end 
  
  patch '/customers/:slug' do 
    
  end 
  
  delete '/customers/:slug/delete' do 
    
  end 
end