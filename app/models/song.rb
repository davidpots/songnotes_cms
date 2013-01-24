class Song < ActiveRecord::Base
  attr_accessible :album, :artist, :lyrics, :title, :year, :lyrics_text, :lyrics_html_mono, :chords, :repeated_chords, :published, :notes, :record_label, :slug
  def to_param
    "#{id} #{slug}".parameterize
  end
end
