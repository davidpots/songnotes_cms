class AddLabelToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :label, :string
  end
end
