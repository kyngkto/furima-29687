class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  validates :email, format: {with: VALID_EMAIL_REGEX}
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]+\z/
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX}
  #validates :password, format: { with: /\A[a-z\d]{6,100}+\z/i, message:"Include both letters and numbers"}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :last_name, presence: true, format:  {with: /\A[ぁ-んァ-ン一-龥]/, message:"Full-width characters"} 
  validates :birth_day, presence: true
  validates :first_name_kana, presence: true, format: { with: /\A[ア-ンー－]+\z/, message:"Full-width katakana characters"}
  validates :last_name_kana, presence: true, format: { with: /\A[ア-ンー－]+\z/, message: "Full-width katakana characters"}
end