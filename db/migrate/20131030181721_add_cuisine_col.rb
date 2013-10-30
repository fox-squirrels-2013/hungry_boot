class AddCuisineCol < ActiveRecord::Migration
  def up
    add_column :restaurants, :cuisine, :string
  end

  def down
    remove_column :restaurants, :cuisine
  end
end
