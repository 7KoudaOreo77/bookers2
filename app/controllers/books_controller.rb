class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      flash[:hoge] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    #@books = Book.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)

    if @book.update(book_params)
      flash[:success2] = "You have updated book successfully."
      redirect_to book_path(@user.id)
    else
      render :edit
    end
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/index'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
