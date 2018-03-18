class Book < ApplicationRecord
	validates :title, :author_last_name, :author_first_name, :isbn, 
	:publish_year, :language, :length, 
	:material_type, :image_url, presence: true


	def search(term, type)
		if type == 'author'
			author_search(term)
		elsif type == 'title'
			title_search(term)
		elsif type == 'genre'
			genre_search(term)
		end
	end


	private

	 def author_search(term)
	   if term.match(/,/)
	     term = term.split(', ')
	   else
	     term = term.split(' ')
	   end
	   if term[0].blank? || term[1].blank?
	     term = term.reject { |t| t.blank? }
	     Book.where("author_last_name like ? or author_first_name like ?", 
	     	'%'+term[0].to_s+'%', '%'+term[0].to_s+'%')
	   else
	     Book.where("(author_last_name like ? and author_first_name like ?) or "+
	     	"(author_last_name like ? and author_first_name like ?)", 
	     	'%'+term[0].to_s+'%', '%'+term[1].to_s+'%', '%'+term[1].to_s+'%', '%'+term[0].to_s+'%')
	   end
	 end

	 def title_search(term)
	   Book.where("title like ?", '%'+term.to_s+'%')
	 end

	 def genre_search(term)
	   Book.where(genre: term)
	 end
end
