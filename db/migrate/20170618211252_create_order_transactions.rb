class CreateOrderTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :order_transactions do |t|
    	t.references :order
    	t.string :action
    	t.integer :amount
    	t.boolean :success
    	t.string :authorization
    	t.string :message
    	t.text :params
      t.timestamps
    end
  end
end
