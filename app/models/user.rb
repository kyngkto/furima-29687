class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]+\z/
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :last_name, presence: true, format:  {with: /\A[ぁ-んァ-ン一-龥]/, message:"Full-width characters"} 
  validates :birth_day, presence: true
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message:"Full-width katakana characters"}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
end