class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :nickname,           presence: true
  validates :email,              presence: true
  validates :password,           presence: true,
                                 format: { with: VALID_PASSWORD_REGEX, message: 'must contain both half-width alphanumeric characters' }, length: { minimum: 6 }
  validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday,           presence: true
end
