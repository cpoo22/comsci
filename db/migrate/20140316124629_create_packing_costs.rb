class CreatePackingCosts < ActiveRecord::Migration
  def change
    create_table :packing_costs do |t|
      t.string :Code
      t.string :Description
      t.float :packing_cost

      t.timestamps
    end
  end
end
