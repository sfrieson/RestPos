class AddsDefaultPinToUser < ActiveRecord::Migration
    def up
        change_column :users, :pin, :integer, default: 1111
    end
    def down
        change_column :users, :pin, :integer, default: nil
    end
end
