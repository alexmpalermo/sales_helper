class CreateCustomerItems < ActiveRecord::Migration
  def change
    create_table :customeritems do |t|
      t.integer :customer_id 
      t.integer :item_id 
    end
  end
end
