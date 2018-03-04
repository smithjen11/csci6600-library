class Book < ApplicationRecord
	validates :title, :author_last_name, :author_first_name, :isbn, 
	:publish_year, :language, :length, 
	:material_type, :image_url, presence: true
end
