class WelcomeController < ApplicationController
  before_action :is_signed_in?, only: :dashboard
  before_action :ensure_admin, only: :admin

  def index
  end

  def dashboard
    @user = current_user
    @current_books = user_loans
    @previous_books = user_history
    @holds = user_holds
    @list = user_list
    @overdue = overdue
  end

  def admin
  end

  private
    def is_signed_in?
      redirect_to root_path unless user_signed_in?
    end

    def user_loans
      Book.select('books.id, books.title, books.author_last_name, books.author_first_name, books.publish_year, books.image_url, loans.date_borrowed, loans.due_date')
          .joins(:loans)
          .where('loans.user_id = ? and loans.date_returned is null', current_user.id)
    end

    def user_history
      Book.select('books.image_url, books.title, books.author_last_name, books.author_first_name, books.publish_year, loans.date_borrowed, loans.date_returned')
          .joins(:loans)
          .where('loans.user_id = ? and loans.date_returned is not null', current_user.id)
    end

    def user_holds
      Book.select('books.id, books.image_url, books.title, books.author_last_name, books.author_first_name, books.publish_year, holds.id as hold_id, holds.release_date')
          .joins(:holds)
          .where('holds.user_id = ? and holds.release_date > ?', current_user.id, DateTime.now)
    end

    def user_list
      Book.select('books.id, books.title, books.author_last_name, books.author_first_name, books.publish_year, '+
          'books.image_url, holds.release_date, loans.due_date')
          .joins('left outer join holds on holds.book_id = books.id')
          .joins('left outer join loans on loans.book_id = books.id')
          .joins(:user_books)
          .where('holds.release_date > ? or loans.date_returned is null', DateTime.now)
          .where('user_books.user_id = ?', current_user.id)
    end

    def overdue
      Book.select('books.id')
          .joins(:loans)
          .where('loans.user_id = ? and loans.due_date <= ? and loans.date_returned is null', current_user.id, DateTime.now)
    end

    def ensure_admin
      redirect_to root_path unless current_user.try(:admin?)
    end
end
