class Song < ActiveRecord::Base
  attr_accessible :album, :artist, :lyrics, :title, :year
end
