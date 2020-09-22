class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  

  has_one_attached :image
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :area_id
    validates :date_of_shipment_id
    validates :price, numericality: {greater_than_or_equal_to: 300},format: { with:/\A[0-9]+\z/}
  end

  belongs_to_active_hash :category
  validates :category_id, numericality: { other_than: 1}
  belongs_to_active_hash :condition
  validates :condition_id, numericality: { other_than: 1}
  belongs_to_active_hash :deliveryFee
  validates :delivery_fee_id, numericality: { other_than: 1}
  belongs_to_active_hash :area
  validates :area_id, numericality: { other_than: 1}
  belongs_to_active_hash :date_of_shipment
  validates :date_of_shipment_id, numericality: { other_than: 1}
end
