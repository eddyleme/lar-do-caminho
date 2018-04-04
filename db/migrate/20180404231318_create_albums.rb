class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :album_title
      t.string :cover_photo
      t.integer :photo_count

      t.timestamps
    end
  end
end
