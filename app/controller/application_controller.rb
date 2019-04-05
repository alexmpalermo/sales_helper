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
    
    def login(username, password)
      rep = Representative.find_by(:username => username)
      if rep && rep.authenticate(password) 
        session[:username] = rep.username
      else 
        redirect to "/login" 
      end 
    end 
    
    def logout!
      session.clear
    end 
  end 
end 