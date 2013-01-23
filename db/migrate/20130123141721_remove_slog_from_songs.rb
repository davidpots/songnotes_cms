class RemoveSlogFromSongs < ActiveRecord::Migration
  def up
    remove_column :songs, :slug
  end

  def down
    add_column :songs, :slug, :string
  end
end
