class AddIndices < ActiveRecord::Migration[5.0]
  def change
  	add_index :books, :title, unique: true
    add_index :books, :author_last_name
    add_index :books, :author_first_name
    add_index :books, :publish_year
    add_index :books, :genre
  end
end
