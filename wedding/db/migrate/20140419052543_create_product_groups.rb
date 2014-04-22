class CreateProductGroups < ActiveRecord::Migration
  def change
    create_table :product_groups do |t|

      t.timestamps
    end
  end
end
