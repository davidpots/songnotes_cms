class AddListenplayToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :listenplay, :text
  end
end
