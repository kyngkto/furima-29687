class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer    :_id     , null: false
      t.integer    :condition_id , null: false
      t.integer    :delivery_Fee_id ,null: false
      t.integer    :area_id , null: false
      t.integer    :date_of_shipment , null: false
      t.timestamps
    end
  end
end
