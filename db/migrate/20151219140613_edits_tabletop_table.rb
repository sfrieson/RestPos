class EditsTabletopTable < ActiveRecord::Migration
  def up
      change_column :tabletops, :status, :string, default: "clean"
      change_column :tabletops, :capacity, :integer, default: 2
      change_column :tabletops, :occupied, :boolean, default: false
  end
  def down
      change_column :tabletops, :status, :string, default: nil
      change_column :tabletops, :capacity, :integer, default: nil
      change_column :tabletops, :occupied, :boolean, default: nil
  end
end
