class CreateQueries < ActiveRecord::Migration[5.1]
  def change
    create_table :queries do |t|
      t.references :user
      t.references :subcat
    	t.string :first_name
    	t.string :middle_name
    	t.string :last_name
    	t.string :address_one
    	t.string :address_two
    	t.references :state
    	t.string :city
    	t.string :zip
    	t.string :phone 
    	t.string :email
    	t.date :birth
    	t.string :status
   		t.text :details
      t.timestamps
    end
  end
end
