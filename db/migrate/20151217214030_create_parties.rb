class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :reservation
      t.integer :size

      t.timestamps null: false
    end
  end
end
