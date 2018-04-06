class UserBooksController < ApplicationController
  before_action :set_user_book, only: [:show, :edit, :update, :destroy]

  def index
    @user_books = UserBook.all
  end

  def show
  end

  def new
    @user_book = UserBook.new
  end

  def edit
  end

  def create
    @user_book = UserBook.new(user_book_params)

    respond_to do |format|
      if @user_book.save
        format.html { redirect_to :back, notice: 'Book was added to favorites.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_book.update(user_book_params)
        format.html { redirect_to :back, notice: 'User book was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user_book.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Book was removed from favorites.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_book
      @user_book = UserBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_book_params
      params.require(:user_book).permit(:user_id, :book_id)
    end
end
