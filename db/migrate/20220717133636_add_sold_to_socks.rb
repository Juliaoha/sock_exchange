class AddSoldToSocks < ActiveRecord::Migration[7.0]
  def change
    add_column :socks, :sold, :boolean, :default => false
  end
end
