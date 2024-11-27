class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|
      t.integer :user_id
      t.integer :room_id
      t.date :check_in
      t.date :check_out
      t.integer :people

      t.timestamps
    end

    #外部キー制約を追加して、検索パフォーマンスを向上
    add_index :reserves, :user_id
    add_index :reserves, :room_id
    add_foreign_key :reserves, :users
    add_foreign_key :reserves, :rooms
  end
end
