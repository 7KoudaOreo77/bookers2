class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :introduction, presence: true

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
     redirect_to books_path
   else
      render :new
   end
  end

  def get_image
    if book.attached?
      book
    else
      'no_image.jpg'
    end
  end

  @book = Book.find(1)
  @book.get_image

  def get_image
    unless book.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      book.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      book
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
