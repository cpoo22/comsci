class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order
      t.string :product_code
      t.string :product_name
      t.integer :weight
      t.decimal :unit_price, :precision => 8, :scale => 2
      t.integer :quantity
      t.integer :discount
      t.decimal :items_price, :precision => 8, :scale => 2
      t.string :serial_no
      t.decimal :postage, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
