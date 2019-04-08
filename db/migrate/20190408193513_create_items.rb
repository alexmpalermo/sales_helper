class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name 
      t.string :quantity
      t.string :date 
      t.integer :customer_id 
    end 
  end
end
