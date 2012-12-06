class AddPublishedToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :published, :boolean, default: false
  end
end
