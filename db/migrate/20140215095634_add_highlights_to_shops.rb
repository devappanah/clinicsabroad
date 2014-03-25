class AddHighlightsToShops < ActiveRecord::Migration
  def change
    add_column :shops, :highlights, :text
  end
end
