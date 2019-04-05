class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name 
      t.string :quantity 
      t.string :date 
    end 
  end
end
