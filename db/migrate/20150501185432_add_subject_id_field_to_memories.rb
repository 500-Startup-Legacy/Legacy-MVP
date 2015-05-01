class AddSubjectIdFieldToMemories < ActiveRecord::Migration
  def change
    add_column :memories, :subject_id, :integer
    remove_column :memories, :user_id
    remove_column :memories, :memorialized_user_id
  end
end
