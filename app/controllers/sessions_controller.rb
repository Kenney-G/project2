class SessionsController < ApplicationController
    
  get '/login' do 
      if !logged_in?
      erb :'/sessions/login'
      else
        erb :'/users/show'
      end
    end
   
    post '/login' do 
      !logged_in?
      user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password]) 
          session[:id] = user.id
          redirect "/users/show"
        else
          @error = "I couldn't get that to work. Try something else?" 
          erb :'/sessions/login'
        end
    end
  
      
  delete '/logout' do
    session.clear
    redirect "/"
  end


end