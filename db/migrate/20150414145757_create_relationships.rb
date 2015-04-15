class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :memorializer_id
      t.integer :memorialized_id

      t.timestamps null: false
    end

    add_index :relationships, :memorializer_id 
    add_index :relationships, :memorialized_id 
    add_index :relationships, [:memorializer_id, :memorialized_id], unique:true
  end
end
