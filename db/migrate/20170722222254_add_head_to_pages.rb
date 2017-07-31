class AddHeadToPages < ActiveRecord::Migration[5.1]
  def self.up
    change_table :pages do |t|
      t.string :head
    end
  end

  def self.down
    remove_column :pages, :head
  end
end
