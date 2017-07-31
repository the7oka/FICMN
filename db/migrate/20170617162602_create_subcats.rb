class CreateSubcats < ActiveRecord::Migration[5.1]
  def change
    create_table :subcats do |t|
    	t.references :cat
    	t.string :title
    	t.text :description
      t.timestamps
    end
  end
end
