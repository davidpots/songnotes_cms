class Song < ActiveRecord::Base
  attr_accessible :artist_id, :album_id, :lyrics, :title, :year, :lyrics_text, :lyrics_html_mono, :chords, :repeated_chords, :published, :notes, :record_label, :slug, :key, :lyrics_raw, :lyrics_signature, :url_wikipedia, :url_youtube_official, :url_rdio, :listenplay
  belongs_to :artist
  belongs_to :album
  def to_param
    "#{id} #{slug}".parameterize
  end
  def older
    Song.where(["id < ?", id]).last
  end
  def newer
    Song.where(["id > ?", id]).first
  end
  def summary
    {:title => title, :year => year, :key => key, :artist_name => artist.name }
  end
end
