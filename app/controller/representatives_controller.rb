class RepresentativesController < ApplicationController
  
  get '/login' do
     if logged_in?
      redirect to "/representatives/#{current_user.id}"
      else 
    erb :"/representatives/login.html"
    end
  end 
  
  get '/signup' do
     if logged_in?
      redirect to "/representatives/#{current_user.id}"
    else 
      erb :"/representatives/signup.html"
    end 
  end 
  
  get '/logout' do
    if logged_in?
      session.clear
      redirect to "/"
    else
      redirect to "/"
      end
  end 
  
  get '/representatives/:id' do 
   if logged_in? 
    @representative = Representative.find_by_id(params[:id])
    if @representative == current_user
    erb :"/representatives/show.html"
  else 
    redirect to "/login"
  end
  else 
    redirect to '/login'
  end 
end 
  
  post '/login' do
    if params[:username] != "" &&  params[:password] != "" 
      @representative = Representative.find_by(:username => params[:username])
      if @representative && @representative.authenticate(params[:password])
        session[:representative_id] = @representative.id
        redirect to "/representatives/#{@representative.id}"
      else
        redirect '/login'
      end
    else
      redirect '/'
    end
  end 
  
  post '/signup' do 
    if params[:username] != "" &&  params[:password] != "" && params[:name] != ""
      if Representative.find_by(:username => params[:username])
        #session.clear
        redirect to "/signup"
      end 
    @representative = Representative.create(username: params[:username], password: params[:password], name: params[:name], territory: params[:territory])
    session[:representative_id] = @representative.id 
    redirect to "/representatives/#{@representative.id}"
  else 
    redirect to "/signup"
  end
  end 
  
  
end