#//User-specific routing such as signing up or logging in

class UsersController < ApplicationController

  # GET: /users
    #//Individual user's private homepage
  get "/users" do
    erb :"/users/index" 
  end

  # GET: /users/new
    #//Signup view
  get "/users/new" do
    erb :"/users/new"
  end

  # POST: /users
    #//Add a new user to the database
  post "/users" do
    User.find_by_username(params[:username]).nil?
    @user = User.new(username: params[:username], password: params[:password])
      if @user.save
        session[:id] = @user.id 
        redirect "/"      
      else
        @error="Seems that may be taken. Try logging in if it's you!"
        erb :'users/new'
      end
      end
end