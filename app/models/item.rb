class Item < ApplicationRecord
  has_many :genres, dependent: :destroy
  attachment :image
end
