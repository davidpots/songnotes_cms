class FixUrlslug < ActiveRecord::Migration
  def change
    rename_column :songs, :urlslug, :slug
  end
end
