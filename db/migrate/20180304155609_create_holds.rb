class CreateHolds < ActiveRecord::Migration[5.0]
  def change
    create_table :holds do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :request_date
      t.datetime :release_date

      t.timestamps
    end
  end
end
