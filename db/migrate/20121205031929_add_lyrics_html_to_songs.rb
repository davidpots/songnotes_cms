class AddLyricsHtmlToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :lyrics_html_mono, :text
    add_column :songs, :lyrics_html_custom, :text
  end
end
