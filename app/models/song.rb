class Song < ActiveRecord::Base
  attr_accessible :album, :artist, :lyrics, :title, :year, :lyrics_text, :lyrics_html_mono, :chords, :repeated_chords, :published, :notes, :record_label
  extend FriendlyId
  friendly_id :id_and_title, use: :slugged
  def id_and_title
    "#{id}-#{title}"
  end
end
