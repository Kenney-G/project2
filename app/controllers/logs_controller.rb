class LogsController < ApplicationController

  def set_log 
    @log = log.find_by_id(params[:id])
    if @log.nil?
      flash[:error] = "Couldn't find a log with id: #{params[:id]}"
      redirect "/logs"
    end
  end
  
  # GET: /logs
  get "/logs" do
    
    @logs = Log.all
    erb :"/logs/index"
  end

  # GET: /logs/new
  get "/logs/new" do
    @log = Log.new
    erb :"/logs/new"
  end

  # POST: /logs
  post "/logs" do
    @log = current_user.logs.build(title: params[:log][:title],console: params[:log][:console],desc: params[:log][:desc])
    if @log.save
      redirect "/logs"
    else

      erb ":logs/new"
    end
  end

  # GET: /logs/5
  get "/logs/:id" do
    set_log
    @log = Log.find(params[:id])
    erb :"/logs/show"
  end

  # Retrieve a log with the matching parameter and allow it to be edited if the correct user is logged in.
  set_log
  get "/logs/:id/edit" do
    erb :"/logs/edit"
  end

  #Update an existing backlog
  patch "/logs/:id" do
    set_log
    if @log.update(title: params[:log][:title], content:params[:log][:content])
      flash[:success] = "log successfully updated"
      redirect "/logs/#{@log.id}"
    else 
      erb :"/logs/edit.html"
    end

  # DELETE: /logs/5/delete
    delete "/logs/:id/delete" do
    set_log
    redirect "/logs"
  end
  
end
