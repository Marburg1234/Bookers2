class Book < ApplicationRecord

  # アソシエートする(userモデルと)
  belongs_to :user

end
