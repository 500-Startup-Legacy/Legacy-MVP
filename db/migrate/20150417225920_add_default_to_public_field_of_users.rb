class AddDefaultToPublicFieldOfUsers < ActiveRecord::Migration
  def change
    change_column :users, :public, :boolean, :default => false
  end
end
