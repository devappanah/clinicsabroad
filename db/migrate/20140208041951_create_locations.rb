class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.text :address
      t.references :shop, index: true

      t.timestamps
    end
  end
end
