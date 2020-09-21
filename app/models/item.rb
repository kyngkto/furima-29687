class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


  has_one_attached :image
  belongs_to :user

  validates :image, presence:true
  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :area_id, presence: true
  validates :date_of_shipment_id, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300},format: { with:/\A[0-9]+\z/}


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
