class AddColumnCuisine < ActiveRecord::Migration
  def change
    add_column :restaurants, :cuisine, :string
  end
end
