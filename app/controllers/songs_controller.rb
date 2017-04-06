class SongsController < ApplicationController
  # Read - all songs
  get '/songs' do
    erb :"/songs/index"
  end

  #Create - new song

  get '/songs/new' do
    erb :"/songs/new"
  end

  post '/songs' do

    @song = Song.new(params[:song])
    if !params["genre"]["name"].empty?
      @song.genres << Genre.find_or_create_by(params[:genre])
    end
    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_or_create_by(params[:artist])
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end



  # Update

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/edit"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    if !params[:genre][:name].empty?
      @song.genres << Genre.find_or_create_by(params[:genre])
    end
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(params[:artist])
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

  # Read - single song

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end


end
