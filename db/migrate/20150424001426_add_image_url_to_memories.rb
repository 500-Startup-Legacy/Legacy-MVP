class AddImageUrlToMemories < ActiveRecord::Migration
  def change
    add_column :memories, :image_url, :string
  end
end
