class Api::V1::SongsController < ApplicationController
  def index
    @songs = Song.includes(:artist).all.map(&:summary)
    render :json => @songs.to_json
  end
end
