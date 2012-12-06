class Song < ActiveRecord::Base
  attr_accessible :album, :artist, :lyrics, :title, :year, :lyrics_text, :lyrics_html_mono, :lyrics_html_custom, :published
end
