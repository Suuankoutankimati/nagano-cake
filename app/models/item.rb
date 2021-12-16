class Item < ApplicationRecord

    belongs_to :genre,foreign_key: 'genre_id',optional: true
    attachment :image

    validates :name, presence: true
    validates :non_tax_price, presence: true
	validates :introduction, presence: true

end