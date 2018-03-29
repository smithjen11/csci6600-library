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
  end

  def admin
  end

  private
  	def is_signed_in?
      redirect_to root_path unless user_signed_in?
    end

    def user_loans
    	Book.joins(:loans).where('loans.user_id = ? and loans.due_date > ? and loans.date_returned is null', current_user.id, DateTime.now)
    end

    def user_history
    	Book.joins(:loans).where('loans.user_id = ? and loans.date_returned is not null', current_user.id)
    end

    def user_holds
    	Book.select('books.*, holds.release_date')
    			.joins(:holds)
    			.where('holds.user_id = ? and holds.release_date > ?', current_user.id, DateTime.now)
    end

    def user_list
    	Book.joins(:user_books).where('user_books.user_id = ?', current_user.id)
    end

    def ensure_admin
      redirect_to root_path unless current_user.try(:admin?)
    end
end
