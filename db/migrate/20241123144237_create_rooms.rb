class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :image
      t.string :name
      t.string :address
      t.bigint :price
      t.text :intro

      t.timestamps
    end
  end
end
