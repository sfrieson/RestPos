class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.references :party, index: true, foreign_key: true
      t.boolean :nuts
      t.boolean :shellfish
      t.boolean :dairy
      t.boolean :vegetarian

      t.timestamps null: false
    end
  end
end
