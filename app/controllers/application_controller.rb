require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV["-^F=@X!`aV;y=u$a.7`2Z7f`}Lfcj+8`"]
  end

  get "/" do
    erb :welcome
  end

end
