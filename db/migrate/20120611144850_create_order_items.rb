class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.float :price
      t.string :product_code
      t.integer :quantity
      t.float :discount
      t.integer :weight
      t.string :product_name

      t.timestamps
    end
  end
end
