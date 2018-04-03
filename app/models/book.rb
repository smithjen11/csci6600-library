class Book < ApplicationRecord
	validates :title, :author_last_name, :author_first_name, :isbn, 
	:publish_year, :language, :length, 
	:material_type, :image_url, presence: true

	has_many :loans
	has_many :holds
	has_many :user_books


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
	     Book.select('books.id, books.title, books.author_last_name, books.author_first_name, books.publish_year, '+
          'books.image_url, holds.release_date, loans.due_date')
          .joins('left outer join holds on holds.book_id = books.id')
          .joins('left outer join loans on loans.book_id = books.id')
          .where('holds.release_date > ? or loans.date_returned is null', Time.now)
          .where('books.author_last_name like ? or books.author_first_name like ?', '%'+term[0].to_s+'%', '%'+term[0].to_s+'%')
	   else
	   	 Book.select('books.id, books.title, books.author_last_name, books.author_first_name, books.publish_year, '+
           'books.image_url, holds.release_date, loans.due_date')
           .joins('left outer join holds on holds.book_id = books.id')
           .joins('left outer join loans on loans.book_id = books.id')
           .where('holds.release_date > ? or loans.date_returned is null', Time.now)
           .where('(books.author_last_name like ? and author_first_name like ?) or '+
           	'(author_last_name like ? and author_first_name like ?)', 
           	'%'+term[0].to_s+'%', '%'+term[1].to_s+'%', '%'+term[1].to_s+'%', '%'+term[0].to_s+'%')
	   end
	 end

	 def title_search(term)
	 	 Book.select('books.id, books.title, books.author_last_name, books.author_first_name, books.publish_year, '+
          'books.image_url, holds.release_date, loans.due_date')
          .joins('left outer join holds on holds.book_id = books.id')
          .joins('left outer join loans on loans.book_id = books.id')
          .where('holds.release_date > ? or loans.date_returned is null', Time.now)
          .where('title like ?', '%'+term.to_s+'%')
	 end

	 def genre_search(term)
	 	 Book.select('books.id, books.title, books.author_last_name, books.author_first_name, books.publish_year, '+
          'books.image_url, holds.release_date, loans.due_date')
          .joins('left outer join holds on holds.book_id = books.id')
          .joins('left outer join loans on loans.book_id = books.id')
          .where('holds.release_date > ? or loans.date_returned is null', Time.now)
          .where(genre: term)
	 end
end
