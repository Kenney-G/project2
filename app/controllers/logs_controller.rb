class LogsController < ApplicationController

  # GET: /logs
  get "/logs" do
    @logs = Log.all
    erb :"/logs/index.html"
  end

  # GET: /logs/new
  get "/logs/new" do
    erb :"/logs/new.html"
  end

  # POST: /logs
  post "/logs" do
    redirect "/logs"
  end

  # GET: /logs/5
  get "/logs/:id" do
    erb :"/logs/show.html"
  end

  # GET: /logs/5/edit
  get "/logs/:id/edit" do
    erb :"/logs/edit.html"
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
