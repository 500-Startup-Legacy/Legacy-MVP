class AddLegacyContactEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :legacy_contact_email, :string
  end
end
