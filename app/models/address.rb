class Address < ApplicationRecord
  def full_address
    '〒' + post_code + ' ' + address + ' ' + name
  end
end
