class AddCityToShops < ActiveRecord::Migration
  def change
    add_reference :shops, :city, index: true
  end
end
