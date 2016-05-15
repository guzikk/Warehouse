class Category < ActiveRecord::Base
	
	has_many :links
	has_many :products, through: :links 
	accepts_nested_attributes_for :links
end
