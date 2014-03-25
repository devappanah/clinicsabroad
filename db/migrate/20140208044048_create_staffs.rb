class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.text :education
      t.text :skills
      t.references :shop, index: true
      t.string :avatar

      t.timestamps
    end
  end
end
