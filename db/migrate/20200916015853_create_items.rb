class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :category_id
      t.integer :price
      t.integer :condition_id
      t.integer :delivery_fee_id
      t.integer :area_id
      t.integer :date_of_shipment_id
      t.text :info
      t.references :user_id
      t.timestamps
    end
  end
end
