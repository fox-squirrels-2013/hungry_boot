class AddPriceRangeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :price_range, :string
  end
end
