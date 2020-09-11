#//Read-only class for users to select their titles from

class GamesController < ApplicationController

  # GET: /games


  get "/games" do
    erb :"/games/index "
  end

  # GET: /games/5
  get "/games/:id" do
    erb :"/games/show "
  end

end
