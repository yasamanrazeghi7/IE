class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :description
      t.string :photo_album
      t.belongs_to :product_group
      t.string :name
      t.timestamps
    end
  end
end
