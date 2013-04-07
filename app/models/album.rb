class Album < ActiveRecord::Base
  attr_accessible :artist_id, :image_url, :label, :name, :url_rdio, :url_wikipedia, :year
  belongs_to :artist
  has_many :songs
end
