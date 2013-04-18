class PagesController < ApplicationController
  layout 'redux'
  def home
    # Added Apr14, most recent
    @recent_songs = Song.where(published: true).all(order: 'created_at DESC', limit: 12)

    # From February, probably can be improved or removed eventually
    @songs_by_months = Song.where(published: true).all(:order => 'created_at DESC', :limit => 7)
    @songs_random = Song.where(published: true).all(:order => 'created_at DESC').sample(12)
    @song_count = Song.where(published: true).count
  end
end