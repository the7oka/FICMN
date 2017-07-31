class AddLinkToCats < ActiveRecord::Migration[5.1]
  def self.up
    change_table :cats do |t|
      t.string :img_link
      t.text :description, default: "Please put description here"
    end
    change_table :orders do |t|
      t.string :business_name
      t.string :policy_num
      t.references :subcat
      t.references :user
    end
    change_table :queries do |t|
      t.string :business_name
    end
  end

  def self.down
    remove_column :cats, :img_link
    remove_column :cats, :description
    remove_column :orders, :policy_num
    remove_column :orders, :subcat_id
    remove_column :orders, :user_id
    remove_column :orders, :business_name
    remove_column :queries, :business_name
  end
end
