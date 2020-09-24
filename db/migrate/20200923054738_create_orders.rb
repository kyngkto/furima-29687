class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :price   ,null: false
      t.integer :number
      t.integer :exp_month
      t.integer :exp_year
      t.integer :cvc
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
