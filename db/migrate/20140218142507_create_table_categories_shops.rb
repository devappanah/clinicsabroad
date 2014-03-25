class CreateTableCategoriesShops < ActiveRecord::Migration
  def change
    create_table :categories_shops, :id => false do |t|
      t.references :category
      t.references :shop
    end
  end
end
