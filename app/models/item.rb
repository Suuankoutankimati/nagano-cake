class Item < ApplicationRecord
    belongs_to :genre, optional: true
    attachment :image
    
    # 税込金額を求めるメソッド
    def with_tax_price
        (non_tax_price * 1.1).floor
    end
end