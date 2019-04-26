class RenameUsers < ActiveRecord::Migration
  def self.up
    rename_table :users, :old_users
  end

  def self.down
    rename_table :old_users, :users
  end
end
