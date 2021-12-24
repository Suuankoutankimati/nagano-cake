class Item < ApplicationRecord

    has_many :order_details
    has_many :cart_items
    has_many :orders, through: :order_details
    belongs_to :genre,foreign_key: 'genre_id',optional: true
    
    attachment :image

    # 税込金額を求めるメソッド
    def with_tax_price
        (non_tax_price * 1.1).floor
    end
    
    # 検索機能で商品名と紹介文のどちらか一方でも部分一致したら出力するメソッド
    def self.search(keyword)
        where(["name like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
        
    end
end