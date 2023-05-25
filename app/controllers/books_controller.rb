class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def create

    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @book = @book
      @books = Book.all
      render :index
    end
  end

  def show
  end

  def edit
  end
end
