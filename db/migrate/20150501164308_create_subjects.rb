class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :user_id
      t.string :name
      t.string :email
      t.string :group_tag
      t.string :twilio_number

      t.timestamps null: false
    end
  end
end
