class SessionsController < ApplicationController
    
  get '/login' do 
      erb :'/sessions/login'
    end
   
    post '/login' do 
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