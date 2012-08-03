class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :customer
      t.decimal :total_price, :precision => 8, :scale => 2
      t.integer :discount
      t.date :order_date
      t.integer :total_weight

      t.timestamps
    end
    add_index :orders, :customer_id
  end
end
