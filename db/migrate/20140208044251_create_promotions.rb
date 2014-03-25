class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :title
      t.text :description
      t.datetime :exp_date
      t.string :avatar
      t.references :shop, index: true

      t.timestamps
    end
  end
end
