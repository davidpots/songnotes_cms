class Song < ActiveRecord::Base
  attr_accessible :artist_id, :album_id, :lyrics, :title, :year, :lyrics_text, :lyrics_html_mono, :chords, :repeated_chords, :published, :notes, :record_label, :slug, :key, :lyrics_raw, :lyrics_signature, :url_wikipedia, :url_youtube_official, :url_rdio
  belongs_to :artist
  belongs_to :album
  def to_param
    "#{id} #{slug}".parameterize
  end
end
