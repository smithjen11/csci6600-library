class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :date_borrowed
      t.datetime :due_date
      t.datetime :date_returned
      t.integer :renewed_count
      t.boolean :overdue
      t.decimal :fine
      t.datetime :fine_paid_date

      t.timestamps
    end
  end
end
