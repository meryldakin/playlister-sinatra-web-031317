class ApplicationController < Sinatra::Base
  enable :sessions
  use Rack::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }



  def all_artists
    Artist.all
  end

  def all_genres
    Genre.all
  end

  def all_songs
    Song.all
  end

  get '/' do
    erb :'index'
  end

end
