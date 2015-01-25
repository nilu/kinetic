class AddUserIdToContacts < ActiveRecord::Migration
  def up
    add_column :contacts, :user_id, :int
  end

  def down
    remove_column :contacts, :user_id
  end
end
