class AddAmountToOrders < ActiveRecord::Migration[5.1]
  def self.up
    change_table :orders do |t|
      t.integer :payment_amount
    end
  end

  def self.down
    remove_column :orders, :payment_amount
  end
end
