class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.references :event, foreign_key: true
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
