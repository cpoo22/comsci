class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :title
      t.string :first_name
      t.string :surname
      t.string :address_1
      t.string :address_2
      t.string :address_3
      t.string :town
      t.string :county
      t.string :postcode
      t.string :daytel
      t.string :hometel
      t.boolean :deleted
      t.boolean :mailbox1
      t.boolean :mailbox2
      t.boolean :mailbox3
      t.string :ccNo1
      t.string :ccNo2
      t.string :ccNo3
      t.string :ccNo4
      t.string :ccNo5
      t.string :ccDate
      t.string :ccstart_date
      t.string :ccissue_number
      t.string :cc_ext
      t.boolean :email
      t.string :country
      t.string :agendid
      t.string :email_address
      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
