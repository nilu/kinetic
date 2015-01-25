class AddContactsTable < ActiveRecord::Migration
  def up
    create_table :contacts do |t|
      t.string :email
      t.timestamps
    end
  end

  def down
    remove_table :contacts
  end
end
