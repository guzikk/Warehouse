class Product < ActiveRecord::Base

	has_many :links, dependent: :destroy
  	has_many :categories, through: :links 
 	accepts_nested_attributes_for :links

 	validates :name, :price, presence: true
	has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: '/images/:style/missing.png'
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
