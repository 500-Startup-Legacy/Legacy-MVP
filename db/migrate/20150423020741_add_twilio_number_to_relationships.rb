class AddTwilioNumberToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :twilio_number, :string
  end
end
