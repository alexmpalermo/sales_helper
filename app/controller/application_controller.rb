require './config/environment'

class ApplicationController < Sinatra::Base 
  configure do 
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "saleshelper"
  end 
  
  get '/' do
    erb :"index.html"
  end 
  
  helpers do 
    def logged_in?
      !!session[:representative_id]
    end
  
    def current_user 
      Representative.find_by_id(session[:representative_id])
    end
    
    def redirect_if_not_logged_in
      if !logged_in?
        redirect to "/login"
    end 
  end 
  end 
end 