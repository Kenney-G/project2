#//User-specific routing such as signing up or logging in

class UsersController < ApplicationController

  # GET: /users
    #//Individual user's private homepage
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/new
    #//Signup view
  get "/users/new" do
    erb :"/users/new"
  end

  # POST: /users
    #//Add a new user to the database
  post "/users" do
    @user = User.new(username: params[:username], password: params[:password])
      if @user.save
        session[:id] = @user.id
        redirect "/users/"
      
      else
        erb :'users/new'
    
      end
    end

  # GET: /users/5
    #User's public read-only profile
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
    #//View for user to edit account information
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
    #//Apply changes from edit route
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
    #Remove user from database
  delete "/users/:id/delete" do
    redirect "/users"
  end
  
end
