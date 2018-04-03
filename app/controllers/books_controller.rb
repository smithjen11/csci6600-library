class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin, only: [:new, :create, :edit, :update, :destroy]

  # GET /books
  def index
    @books = book_info
    @categories = Book.select(:genre).group(:genre)
  end

  # GET /books/1
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /books/1
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
    end
  end

  def search
    @books = Book.new.search(search_params[:term], search_params[:type])
    @search_term = search_params[:term]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author_last_name, :author_first_name, :isbn, :publish_year, :genre, :reading_level, :subject, :language, :length, :material_type, :series, :series_number, :image_url)
    end

    def search_params
      params.permit(:term, :type)
    end

    def ensure_admin
      redirect_to root_path unless current_user.try(:admin?)
    end

    def book_info
      Book.select('books.id, books.title, books.author_last_name, books.author_first_name, books.publish_year, '+
          'books.image_url, holds.release_date, loans.due_date')
          .joins('left outer join holds on holds.book_id = books.id')
          .joins('left outer join loans on loans.book_id = books.id')
          .where('holds.release_date > ? or loans.date_returned is null', Time.now)
    end
end
