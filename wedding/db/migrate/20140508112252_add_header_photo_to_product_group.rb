class AddHeaderPhotoToProductGroup < ActiveRecord::Migration
  def change
    add_column :product_groups, :header_photo, :string
  end
end
