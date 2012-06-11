class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :customer
      t.float :total_price
      t.float :discount
      t.date :order_date
      t.integer :total_weight

      t.timestamps
    end
    add_index :orders, :customer_id
  end
end
