class CreateOrder < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.date :order_date
      t.float :discount
      t.integer :total_weight
      t.float :total_price
      t.integer :customer_id
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
