class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.string :post_code
      t.string :address
      t.string :name
      t.integer :payment_method
      t.integer :shipping_cost
      t.integer :total_price
      t.integer :status

      t.timestamps
    end
  end
end
