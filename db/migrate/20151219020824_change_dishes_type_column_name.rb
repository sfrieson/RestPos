class ChangeDishesTypeColumnName < ActiveRecord::Migration
    def up
       rename_column :dishes, :type, :course
    end
    def down
        rename_column :dishes, :course, :type
    end
end
