class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :seller_id
      t.integer :buyer_id
      t.integer :sock_id
      t.integer :price
      t.timestamps
    end
  end
end
