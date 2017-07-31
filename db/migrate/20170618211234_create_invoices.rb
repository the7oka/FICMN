class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
    	t.references :query
    	t.text :details
    	t.integer :amount
    	t.boolean :paid, default: false
    	t.time :purchased_at
      t.timestamps
    end
  end
end
