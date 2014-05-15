class AddSuggestionsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :suggestions, :integer , :default => '0'
  end
end
