class RepresentativesController < ApplicationController
  
  get '/login' do
     if logged_in?
       @representative = current_user
      redirect to "/representatives/#{@representative.slug}"
      else 
    erb :"/representatives/login.html"
    end
  end 
  
  get '/signup' do
     if logged_in?
      @representative = current_user
      redirect to "/representatives/#{@representative.slug}"
    else 
      erb :"/representatives/signup.html"
    end 
  end 
  
  get '/logout' do
    if logged_in?
      session.clear
      redirect to "/login"
    else
      redirect to "/"
      end
  end 
  
  get '/representatives/:slug' do 
    @representative = Representative.find_by_slug(params[:slug])
    erb :"/representatives/show.html"
  end 
  
  post '/login' do
    if params[:username] != "" &&  params[:password] != "" 
      @representative = Representative.find_by(:username => params[:username])
      if @representative && @representative.authenticate(params[:password])
        session[:representative_id] = @representative.id
        redirect to "/representatives/#{@representative.slug}"
      else
        redirect '/login'
      end
    else
      redirect '/'
    end
  end 
  
  post '/signup' do 
    if params[:username] != "" &&  params[:password] != "" && params[:name] != ""
    @representative = Representative.create(username: params[:username], password: params[:password], name: params[:name], territory: params[:territory])
    session[:representative_id] = @representative.id 
    redirect to "/representatives/#{@representative.slug}"
  else 
    redirect to "/signup"
  end
  end 
  
  
end