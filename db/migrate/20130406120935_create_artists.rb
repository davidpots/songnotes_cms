class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.text :bio_short
      t.text :bio_long
      t.string :image_url
      t.string :url_website
      t.string :url_twitter
      t.string :url_facebook
      t.string :url_wikipedia
      t.string :url_youtube_official
      t.string :url_rdio

      t.timestamps
    end
  end
end
