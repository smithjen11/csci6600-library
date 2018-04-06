require 'net/http'
require 'json'

desc 'Popluating books table with data from openlibrary.org'
task :populate_books => :environment do
	url = 'http://openlibrary.org/subjects/overdrive.json?limit=150'
	uri = URI(url)
	response = Net::HTTP.get(uri)
	data = JSON.parse(response)

	book_detail = []

	count = 0

	data['works'].each do |work|
		res = Net::HTTP.get(URI('https://openlibrary.org/api/books?bibkeys='+work['cover_edition_key']+'&format=json&jscmd=data'))
		details = JSON.parse(res)
		puts details[work['cover_edition_key']]['title']

		if details[work['cover_edition_key']]['title'] && details[work['cover_edition_key']]['identifiers']['isbn_10']
			begin
				subject = details[work['cover_edition_key']]['subjects'][0]['name']
			rescue
				subject = 'Other'
			end

			if (details[work['cover_edition_key']]['classifications']) && (details[work['cover_edition_key']]['classifications']['dewey_decimal_class'])
				genre = details[work['cover_edition_key']]['classifications']['dewey_decimal_class'][0]
			elsif details[work['cover_edition_key']]['subjects']
				genre = details[work['cover_edition_key']]['subjects'][-1]['name']
			else
				genre = 'Other'
			end

			if details[work['cover_edition_key']]['authors']
				author = details[work['cover_edition_key']]['authors'][0]['name']
			else
				author = 'Unknown'
			end
			Book.create!(title: details[work['cover_edition_key']]['title'], 
									author: author,
									isbn: details[work['cover_edition_key']]['identifiers']['isbn_10'][0],
									publish_year: details[work['cover_edition_key']]['publish_date'] || 1900,
									genre: genre,
									subject: subject,
									language: 'English',
									image_url: details[work['cover_edition_key']]['cover']['medium'])
			count += 1
		end
	end
	puts count
end

