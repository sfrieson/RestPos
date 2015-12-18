class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :type
      t.integer :price
      t.boolean :nuts
      t.boolean :shellfish
      t.boolean :dairy
      t.boolean :vegetarian

      t.timestamps null: false
    end
  end
end
