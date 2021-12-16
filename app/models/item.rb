class Item < ApplicationRecord
    validates :name, presence: true
    validates :non_tax_price, presence: true
	validates :introduction, presence: true
	validates :is_active, presence: true

    belongs_to :genre
    attachment :image
end