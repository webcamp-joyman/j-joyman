class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :member_id,       null: false
      t.string :post_code,        null: false
      t.string :address,          null: false
      t.string :name,             null: false
      t.integer :postage,         null: false
      t.integer :bill,            null: false
      t.integer :method_payment,  null: false
      t.integer :status,          null: false

      t.timestamps
    end
  end
end
