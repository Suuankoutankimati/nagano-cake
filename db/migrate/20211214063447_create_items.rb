class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :genre, foreign_key: true
      t.string :name
      t.integer :non_tax_price
      t.string :image_id
      t.boolean :is_active, null: false, default: false
      t.text :introduction

      t.timestamps
    end
  end
end
