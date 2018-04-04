class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :photo_location
      t.references :album, foreign_key: true

      t.timestamps
    end
  end
end
