class SongsController < ApplicationController
  before_action :fetch_song, only: %i[show edit update]

  def index
    @songs = Song.all
  end

  def show; end

  def edit; end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
end

  def new
    @song = Song.new
end

  def update
    @song.update(song_params)

    if @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
end

  private

  def fetch_song
    @song = Song.find(params[:id])
end

  def song_params
    params.require(:song).permit(:title, :artist_name, :released, :release_year, :genre)
  end
end
