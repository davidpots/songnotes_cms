class RenameLabelInSongs < ActiveRecord::Migration
  def change
    rename_column :songs, :label, :record_label
  end
end
