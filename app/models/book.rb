class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  def get_image
    if book.attached?
      book
    else
      'no_image.jpg'
    end
  end

  def get_image
    unless book.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      book.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      book
  end

end
