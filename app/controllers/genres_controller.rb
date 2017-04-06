class GenresController < ApplicationController

  get '/genres' do
    erb :"/genres/index"
  end

  #Create - new genre


  # Read - single genre

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :"/genres/show"
  end

end
