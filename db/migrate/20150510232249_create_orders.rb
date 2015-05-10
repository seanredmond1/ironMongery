class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :userid
      t.integer :productid

      t.timestamps null: false
    end
  end
end
