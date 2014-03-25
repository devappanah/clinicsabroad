class AddDescriptionColumnsToShops < ActiveRecord::Migration
  def change
    add_column :shops, :hours_operation, :text
    add_column :shops, :payment_methods, :text
    add_column :shops, :insurance_terms, :text
    add_column :shops, :certifications, :text
    add_column :shops, :additional_services, :text
    add_column :shops, :years_business, :string
  end
end
