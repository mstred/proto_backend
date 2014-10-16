class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :uid
      t.text :description
      t.integer :customer_id
      t.integer :technician_id
      t.integer :status

      t.timestamps
    end
  end
end
