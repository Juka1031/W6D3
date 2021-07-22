class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.references :likey, polymorphic: true

      t.timestamps
    end

    add_index :likes, [:user_id, :likey], unique: true

  end
end
