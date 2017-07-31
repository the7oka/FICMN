class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
    	t.string :title
    	t.string :text1
    	t.string :text2
      t.timestamps
    end
  end
end
