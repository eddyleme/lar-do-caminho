class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.text :description
      t.string :display_photo

      t.timestamps
    end
  end
end
