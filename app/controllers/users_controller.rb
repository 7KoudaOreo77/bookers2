class UsersController < ApplicationController
  def new
   @user = User.new
   @book = Book.new(book_params)

   if @user.new(users_params)
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to book_path(@book.id)
   else
      render :new
   end
  end

  def create
   @user = login(params[:name], params[:email], params[:password]
   if
     redirect_back_or_to root_path, success: "Signed in successfully."
   else
      render :sign_in
   end
  end

  def index
   @users = User.all
   @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = Use.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)

    if @user.update(book_params)
      flash[:success] = "You have updated user successfully."
      redirect_to book_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
   params.require(:user).permit(:name, :introduction)
  end
end
