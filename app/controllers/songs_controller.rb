class SongsController < ApplicationController
  before_filter :prepare_artists, :prepare_albums
  helper_method :sort_column, :sort_direction

  def index
  end

  def show
    # Song being viewed
    @song = Song.find(params[:id])

    # Songs from same year as @song
    @year = @song.year
    @songs_same_year = Song.where(published: true, year: @year).all(:order => 'title ASC')

    # Songs recently added to the site
    @recent_songs = Song.where(published: true).all(order: 'created_at DESC', limit: 8)

    # All songs
    @songs = Song.where(published: true).all(order: 'lower(title)')

  end
  
  private

  def sort_column
    params[:sort] || "title"
  end
  
  def sort_direction
    params[:direction] || "asc"
  end
  
  def prepare_artists
    @artists = Artist.all(order: 'lower(name)')
  end

  def prepare_albums
    @albums = Album.all
  end
  
end