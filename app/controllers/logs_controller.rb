class LogsController < ApplicationController

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
    @log = Log.find(params[:id])
    erb :"/logs/show"
  end

  # GET: /logs/5/edit
  get "/logs/:id/edit" do
    erb :"/logs/edit"
  end

  # PATCH: /logs/5
  patch "/logs/:id" do
    redirect "/logs/:id"
  end

  # DELETE: /logs/5/delete
  delete "/logs/:id/delete" do
    redirect "/logs"
  end
end
