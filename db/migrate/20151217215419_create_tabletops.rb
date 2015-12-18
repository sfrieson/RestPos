class CreateTabletops < ActiveRecord::Migration
  def change
    create_table :tabletops do |t|
      t.boolean :occupied
      t.integer :capacity
      t.string :status
      t.references :party, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
