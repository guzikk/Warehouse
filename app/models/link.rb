class Link < ActiveRecord::Base
  belongs_to :product , :inverse_of => :links
  belongs_to :category, :inverse_of => :links
end
