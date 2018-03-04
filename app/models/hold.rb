class Hold < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :request_date, :release_date, presence: true
end
