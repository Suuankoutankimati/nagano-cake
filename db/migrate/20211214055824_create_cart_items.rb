class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :customer, foreign_key: true
      t.integer :item_id
      t.integer :amount

      t.timestamps
    end
  end
end
