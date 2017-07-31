class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
    	t.references :country
    	t.string :name
    	t.string :iso
      t.timestamps
    end
  end
end
