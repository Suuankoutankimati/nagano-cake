class Item < ApplicationRecord

    has_many :order_details
    has_many :orders, through: :order_details
    has_many :cart_items
    
    belongs_to :genre,foreign_key: 'genre_id',optional: true
    
    attachment :image

    # 税込金額を求めるメソッド
    def with_tax_price
        (non_tax_price * 1.1).floor
    end
end