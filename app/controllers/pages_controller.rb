class PagesController < ApplicationController

  def home
    @recent_songs = Song.where(published: true).all(order: 'created_at DESC', limit: 8)
    @song_count = Song.where(published: true).count
    @artists = Artist.all(order: 'lower(name)')
    @songs = Song.where(published: true).all(order: 'lower(title)')
  end

end