class RemoveLyricsCustomHtmlFromSongs < ActiveRecord::Migration
  def up
    remove_column :songs, :lyrics_html_custom
  end

  def down
    add_column :songs, :lyrics_html_custom, :text
  end
end
