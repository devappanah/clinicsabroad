class RemoveAllCityAndCountry < ActiveRecord::Migration
  def change
    drop_table :cities
    drop_table :countries
    remove_column :shops, :city_id
  end
end
