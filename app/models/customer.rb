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
  VALID_KANA_NAME_REGEX = /\A[ァ-ヴー]+\z/u
  validates :last_name, :first_name, :address, presence: true
  validates :kana_last_name, :kana_first_name, presence: true, format: {with:VALID_KANA_NAME_REGEX}
  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates :post_code, presence: true, format: {with:VALID_POSTAL_CODE_REGEX}
  VALID_PHONE_NUMBER_REGEX = /\A\d{9,10}\z/
  validates :phone_number, presence: true, format: {with:VALID_PHONE_NUMBER_REGEX}
  
end
