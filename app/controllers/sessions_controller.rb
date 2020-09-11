class SessionsController < ApplicationController
    get '/login' do 
      erb :'/sessions/login'
    end
  
    post '/login' do 
      user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password]) 
          session[:id] = user.id
          redirect "/users/index"
        else
          @error = "I couldn't get that to work. Try something else?" 
          erb :'/sessions/lgoin'
        end
    end

    
  end