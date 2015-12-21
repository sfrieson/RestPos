class AddStatusToOrderTable < ActiveRecord::Migration
  def change
      add_column :orders, :status, :string, default: "cooking"
  end
end
