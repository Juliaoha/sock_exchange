class CreateSocks < ActiveRecord::Migration[7.0]
  def change
    create_table :socks do |t|
      t.string :size
      t.string :brand
      t.string :colour
      t.string :quality
      t.integer :price
      t.string :title
      t.text :description
      t.string :foot

      t.timestamps
    end
  end
end
