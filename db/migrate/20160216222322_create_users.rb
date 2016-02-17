class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :street_address
      t.string :city
      t.string :country
      t.string :postal_code
      t.boolean :lol
      t.boolean :dota2
      t.boolean :smite
      t.boolean :hots

      t.timestamps null: false
    end
  end
end
