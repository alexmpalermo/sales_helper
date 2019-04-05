class CreateRepresentatives < ActiveRecord::Migration
  def change
    create_table :representatives do |t|
      t.string :name 
      t.string :username 
      t.string :password_digest 
      t.string :territory 
    end 
  end
end
