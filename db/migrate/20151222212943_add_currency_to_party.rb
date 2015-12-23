class AddCurrencyToParty < ActiveRecord::Migration
  def change
      add_column :parties, :currency, :string
  end
end
