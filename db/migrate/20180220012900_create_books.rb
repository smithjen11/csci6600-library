class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author_last_name
      t.string :author_first_name
      t.string :isbn
      t.integer :publish_year
      t.string :genre
      t.string :reading_level
      t.string :subject
      t.string :language
      t.integer :length
      t.string :material_type
      t.string :series
      t.decimal :series_number
      t.string :image_url

      t.timestamps
    end
  end
end
