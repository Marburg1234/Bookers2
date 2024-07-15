class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# アソシエートする(booksモデルと)
  has_many :books, dependent: :destroy

  # profile写真の保存先を指定する(userモデル経由で保存する)
  has_one_attached :profile_image

  def get_profile_image
    if profile_image.attached?
      profile_image
    else
      'no_image.jpg'
    end
  end

end
