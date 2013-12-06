class PagesController < ApplicationController

  def home
    @recent_songs = Song.where(published: true).all(order: 'created_at DESC', limit: 8)
    @song_count = Song.where(published: true).count
    @artists = Artist.all(order: 'lower(name)')
    @songs = Song.where(published: true).all(order: 'lower(title)')
  end

  def api
    @songs = Song.where(published: true).all(order: 'lower(title)')
  end

  # 1
  # you'd use an AJAX call and hit that URL, just like you do on JakeWorry
  # this is the URL: http://localhost:3000/api/v1/songs.json

  # 2
  # So you don't fuck yourself with Heroku usage, do this.
  # checkout heroku memchaced thing, so this is cached
  # https://devcenter.heroku.com/articles/building-a-rails-3-application-with-memcache
  # TTL = time to live, I'd set that, so that it updates/refreshes every X (3 hours, etc)

end