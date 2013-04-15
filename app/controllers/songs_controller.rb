class SongsController < ApplicationController
  before_filter :prepare_artists, :prepare_albums
  helper_method :sort_column, :sort_direction
  layout 'redux'
  def index
    @nav = sort_column
    # @songs = Song.order(sort_column + ' ' + sort_direction)
    @songs_all = Song.where(published: true).all(:order => 'created_at DESC')
    # @songs = Song.where(published: true).all
    # @songs_by_months = @songs_all.group_by { |t| t.created_at.beginning_of_month }
    @songs_by_months = Song.where(published: true).all(:order => 'created_at DESC').group_by { |s| s.created_at.beginning_of_month }
    @songs_by_artist = Song.where(published: true).all(:order => 'title ASC').group_by { |s| s.artist }
    @songs_by_year = Song.where(published: true).all(:order => 'year DESC').group_by { |s| s.year }
    @songs_by_created_at = Song.where(published: true).all(:order => 'created_at DESC').group_by { |s| s.created_at }
    @songs_by_title = Song.where(published: true).all(:order => 'title ASC').group_by { |s| s.title[0].capitalize.match(/[A-Z]/) ? s.title[0].capitalize : "#" }
  end

  def show
    @song = Song.find(params[:id])
    @songs_all = Song.where(published: true).all(:order => 'created_at DESC',:limit=>10)
    @songs_random = Song.where(published: true).all(:order => 'created_at DESC').sample(7)

    @year = @song.year
    @songs_same_year = Song.where(published: true, year: @year).all(:order => 'title ASC')

    @artist = @song.artist

    # Added Apr14, most recent
    @recent_songs = Song.where(published: true).all(order: 'created_at DESC', limit: 12)
  end

  
  private

  def sort_column
    params[:sort] || "title"
  end
  
  def sort_direction
    params[:direction] || "asc"
  end
  
  def prepare_artists
    @artists = Artist.all
  end

  def prepare_albums
    @albums = Album.all
  end
  
end