class TracksController < ApplicationController

  # GET: /tracks
  get "/tracks" do
    erb :"/tracks/index.html"
  end

  # GET: /tracks/new
  get "/tracks/new" do
    erb :"/tracks/new.html"
  end

  # POST: /tracks
  post "/tracks" do
    redirect "/tracks"
  end

  # GET: /tracks/5
  get "/tracks/:id" do
    erb :"/tracks/show.html"
  end

  # GET: /tracks/5/edit
  get "/tracks/:id/edit" do
    erb :"/tracks/edit.html"
  end

  # PATCH: /tracks/5
  patch "/tracks/:id" do
    redirect "/tracks/:id"
  end

  # DELETE: /tracks/5/delete
  delete "/tracks/:id/delete" do
    redirect "/tracks"
  end
end
