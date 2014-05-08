class ProductGroup < ActiveRecord::Base
	has_many :products
	
	def self.find_products(name)
		return ProductGroup.find_by_name(name).products
	end

	def self.find_header_photo(name)
		return ProductGroup.find_by_name(name).header_photo
		
	end
end
