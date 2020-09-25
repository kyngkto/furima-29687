class CreateDeliverAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :deliver_addresses do |t|
      t.references :wallet
      t.string :postal_code
      t.integer :area_id
      t.string :city  
      t.string :house_number
      t.string :building_name
      t.string :phone_number 
      
      t.timestamps
    end
  end
end
