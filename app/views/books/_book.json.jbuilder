json.extract! book, :id, :title, :author_last_name, :author_first_name, :isbn, :publish_year, :genre, :reading_level, :subject, :language, :length, :material_type, :series, :series_number, :image_url, :created_at, :updated_at
json.url book_url(book, format: :json)
