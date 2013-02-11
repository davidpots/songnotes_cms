class PagesController < ApplicationController
  layout 'redux'
  def home
    @songs_by_months = Song.where(published: true).all(:order => 'created_at DESC', :limit => 7)
    @songs_random = Song.where(published: true).all(:order => 'created_at DESC').sample(7)
    @song_count = Song.where(published: true).count
  end
end