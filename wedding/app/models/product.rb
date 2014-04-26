class Product < ActiveRecord::Base
	belongs_to :product_group
	has_many :comments ,  :foreign_key => 'product_id'
end
