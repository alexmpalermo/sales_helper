class RepresentativesController < ApplicationController
  
  get '/login' do 
    erb :"/representatives/login.html"
  end
  
  get '/signup' do
    erb :"/representatives/signup.html"
  end 
  
  get '/logout' do
    
  end 
  
  get '/representatives/:slug' do 
    erb :"/representatives/show.html"
  end 
  
  post '/login' do
    
    redirect to "/representatives/#{@rep.slug}"
  end 
  
  post '/signup' do 
    
    redirect to "/representatives/#{@rep.slug}"
  end 
  
  
end