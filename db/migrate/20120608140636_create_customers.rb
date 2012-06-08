class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.string :town
      t.string :county
      t.string :country
      t.string :postcode
      t.string :telephone_number
      t.string :mobile_number
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
