class MergeAuthorColumnsInBooksTable < ActiveRecord::Migration[5.0]
  def change
  	rename_column :books, :author_last_name, :author
  	remove_column :books, :author_first_name
  	remove_column :books, :reading_level
  	remove_column :books, :series
  	remove_column :books, :series_number
  	remove_column :books, :length
  	remove_column :books, :material_type
  end
end
