class AddNotnullToStatusOnOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :status, :integer, default: 0, null: false
  end
end
