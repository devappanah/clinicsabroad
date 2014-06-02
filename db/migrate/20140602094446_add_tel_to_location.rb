class AddTelToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :tel, :string
  end
end
