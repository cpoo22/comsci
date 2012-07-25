class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order
      t.string :product_code
      t.string :product_name
      t.integer :weight
      t.float :unit_price
      t.integer :quantity
      t.float :discount
      t.float :items_price

      t.timestamps
    end
  end
end
