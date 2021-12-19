class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { wait: 0, confirm: 1, production: 2,preparation: 3,completion: 4 }

  attribute :shipping_cost, default: 800
  
  

end
