class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
    	t.references :invoice
    	t.string :ip_address
    	t.string :first_name 
    	t.string :last_name
    	t.string :card_type
    	t.date :card_expires_on
      t.string :express_token
      t.string :express_payer_id
      t.string :billing_address
      t.string :billing_address_2
      t.string :country
      t.string :state
      t.string :county
      t.string :city
      t.string :email
      t.string :zipcode
      t.string :phone
      t.timestamps
    end
  end
end
