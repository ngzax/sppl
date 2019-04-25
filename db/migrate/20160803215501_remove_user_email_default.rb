class RemoveUserEmailDefault < ActiveRecord::Migration

  def up
    change_column_default(:users, :email, nil)
  end

  def down
    change_column_default(:users, :email, "")
  end

end
