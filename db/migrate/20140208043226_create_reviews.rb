class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :score
      t.references :user, index: true
      t.references :shop, index: true

      t.timestamps
    end
  end
end
