class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true
      t.references :service, index: true
      t.references :shop, index: true
      t.text     :body
      t.datetime :scheduled_at
      t.string :type

      t.timestamps
    end
  end
end
