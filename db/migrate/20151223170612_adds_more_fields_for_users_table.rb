class AddsMoreFieldsForUsersTable < ActiveRecord::Migration
  def change
      change_table :users do |t|
          t.string :first_name
          t.string :last_name
          t.string :cellphone, limit: 10
      end
  end
end
