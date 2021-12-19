class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :cart_items
  has_many :addresses
  has_many :orders
  
  # ログインする時に退会済みの顧客を弾くためのメソッド
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  validates :last_name, :first_name, :kana_last_name, :kana_first_name, :address, presence: true
  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates :post_code, presence: true, format: {with:VALID_POSTAL_CODE_REGEX}
  validates :phone_number, presence: true, length: {minimum:10,maxmum:11}
  
end
