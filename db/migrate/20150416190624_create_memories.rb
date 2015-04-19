class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.text :content
      t.integer :user_id
      t.integer :memorialized_user_id

      t.timestamps null: false
    end
    add_index :memories, [:user_id]
  end
end
