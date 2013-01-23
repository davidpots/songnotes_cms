class AddUrlslugToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :urlslug, :string
    add_index :songs, :urlslug
  end
end
