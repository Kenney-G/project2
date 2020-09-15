class LogsController < ApplicationController
 require 'pry'

 get "/logs" do
  @logs = Log.all
  erb :"/logs/index"
end
  # GET: /logs/new
  get "/logs/new" do
    redirect_if_not_logged_in
    @log = Log.new
    erb :"/logs/new"
  end

 # POST: /logs
  post "/logs" do
    redirect_if_not_logged_in
    @log = current_user.logs.build(game_title: params[:log][:game_title],game_console: params[:log][:game_console],game_desc: params[:log][:game_desc])
    if @log.save
      redirect "/logs"
    else
      erb :"logs/new"
    end
  end

  # GET: /logs/5
  get "/logs/:id" do
    set_log
    erb :"/logs/show"
  end

  # Retrieve a log with the matching parameter and allow it to be edited if the correct user is logged in.

  get "/logs/:id/edit" do
    set_log
    redirect_if_not_authorized
    erb :"/logs/edit"
  end


  #Update an existing backlog
  patch "/logs/:id" do
    set_log
    redirect_if_not_authorized
    if @log.update(game_title: params[:log][:game_title], game_console: params[:log][:game_console],game_desc: params[:log][:game_desc])
      flash[:success] = "Log successfully updated"
      redirect "/logs/#{@log.id}"
    else 
      erb :"/logs/edit"
    end
  end

  #DELETE: /logs/5/delete
  delete '/logs/:id' do
    set_log
    @log.id = Log.delete(params[:id])
    redirect to("/users")
  end

private

  def set_log 
    @log = Log.find_by_id(params[:id])
    if @log.nil?
      flash[:error] = "Couldn't find a log with id: #{params[:id]}"
      redirect "/logs"
    end
  end

  
  def redirect_if_not_authorized
    redirect_if_not_logged_in
    if !authorize_log(@log)
      flash[:error] = "You don't have permission to do that action"
      redirect "/logs"
    end
  end
  
  def authorize_log(log)
    current_user == log.author
  end
  
end
