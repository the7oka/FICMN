class CreateContactmes < ActiveRecord::Migration[5.1]
  def change
    create_table :contactmes do |t|
    	t.string :name
    	t.string :phone
    	t.string :email
    	t.references :subcat
    	t.text :details
      t.timestamps
    end
  end
end
