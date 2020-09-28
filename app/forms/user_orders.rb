class UserOrders

  include ActiveModel::Model
  attr_accessor :token, :price, :order_id, :item_id, :user_id, :postal_code, :area_id, :city, :house_number,:building_name, :phone_number  

    
  #住所のバリデーション
  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :area_id
    validates :city
    validates :house_number
    validates :phone_number, format:{with: /\A\d{10}$|^\d{11}\z/}
  end
  with_options presence: true do
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    DeliverAddress.create!( order_id: order.id, postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, phone_number: phone_number)
  end

end