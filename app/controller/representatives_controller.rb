class RepresentativesController < ApplicationController
  
  get '/login' do 
    erb :"representatives/login.html"
  end
  
  
end