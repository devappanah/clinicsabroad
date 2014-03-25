class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :duration
      t.references :shop, index: true

      t.timestamps
    end
  end
end
