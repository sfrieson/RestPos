class ChangeUserTypeColumnName < ActiveRecord::Migration
  def up
     rename_column :users, :type, :position
  end
  def down
      rename_column :users, :position, :type
  end
end
