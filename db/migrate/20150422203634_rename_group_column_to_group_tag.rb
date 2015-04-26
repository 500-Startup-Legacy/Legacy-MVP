class RenameGroupColumnToGroupTag < ActiveRecord::Migration
  def change
    rename_column :relationships, :group, :group_tag
  end
end
