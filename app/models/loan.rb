class Loan < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :date_borrowed, presence: true
end
