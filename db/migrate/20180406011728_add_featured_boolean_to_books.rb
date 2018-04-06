class AddFeaturedBooleanToBooks < ActiveRecord::Migration[5.0]
  def change
  	add_column :books, :featured, :boolean, default: false
  end
end
