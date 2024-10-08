class Book < ApplicationRecord

  # アソシエートする(userモデルと)
  belongs_to :user

  # validatesの設定
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

end
