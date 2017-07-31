class AddBusinessToSubcat < ActiveRecord::Migration[5.1]
  def self.up
    change_table :subcats do |t|
      t.boolean :business, default: false
    end
  end

  def self.down
    remove_column :subcats, :business
  end
end
