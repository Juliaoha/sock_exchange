class AddUserIdColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :socks, :user_id, :integer
  end
end
