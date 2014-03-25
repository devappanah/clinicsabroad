class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.string :title
      t.text :description
      t.string :avatar
      t.references :shop, index: true

      t.timestamps
    end
  end
end
