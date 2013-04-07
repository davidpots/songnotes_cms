class Artist < ActiveRecord::Base
  attr_accessible :bio_long, :bio_short, :image_url, :name, :url_facebook, :url_rdio, :url_twitter, :url_website, :url_wikipedia, :url_youtube_official
  has_many :albums
  has_many :songs
end
