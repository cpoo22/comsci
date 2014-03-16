class CreatePostalCosts < ActiveRecord::Migration
  def change
    create_table :postal_costs do |t|
      t.string :code
      t.float :weight
      t.float :cost

      t.timestamps
    end
  end
end
