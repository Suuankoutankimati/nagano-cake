class Address < ApplicationRecord
  belongs_to :customer
  
  def full_address
    '〒' + post_code + ' ' + address + ' ' + name
  end
  
  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates :post_code, presence: true, format: {with:VALID_POSTAL_CODE_REGEX}
  validates :address, presence: true
  validates :name, presence: true
end
