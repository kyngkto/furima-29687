class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A[a-z\d]{6,100}+\z/i, message:"Include both letters and numbers"}
  #validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message:"Include both letters and numbers"}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :last_name, presence: true, format:  {with: /\A[ぁ-んァ-ン一-龥]/, message:"Full-width characters"} 
  validates :birth_day, presence: true
  validates :first_name_kana, presence: true, format: { with: /\A[ア-ンー－]+\z/, message:"Full-width katakana characters"}
  validates :last_name_kana, presence: true, format: { with: /\A[ア-ンー－]+\z/, message: "Full-width katakana characters"}
end