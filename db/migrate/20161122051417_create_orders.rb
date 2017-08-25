class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :total_price
      t.string :state
      t.string :shipment_address

      t.timestamps null: false
    end
  end
end
