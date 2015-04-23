class AddGroupFieldToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :group, :string
  end
end
