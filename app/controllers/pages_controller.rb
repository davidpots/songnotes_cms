class PagesController < ApplicationController

  def home
    @recent_songs = Song.where(published: true).all(order: 'created_at DESC', limit: 6)
    @song_count = Song.where(published: true).count
    #@songs = Song.where(published: true).all(order: 'lower(title)')
    @songs_by_year = Song.all(order: 'year DESC').group_by { |song| song.year }
  end

  def api
    @songs = Song.where(published: true).all(order: 'lower(title)')
  end

end