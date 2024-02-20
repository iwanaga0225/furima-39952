class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :nickname,           presence: true
  validates :password,           format: { with: VALID_PASSWORD_REGEX, message: 'must contain both half-width alphanumeric characters' }, length: { minimum: 6 }
  validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'please input your name using full-width characters (Kanji, Hiragana, or Katakana)' }
  validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'please input your name using full-width characters (Kanji, Hiragana, or Katakana)' }
  validates :first_name_kana,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'please input your name_kana using full-width Katakana characters' }
  validates :last_name_kana,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'please input your name_kana using full-width Katakana characters' }
  validates :birthday,           presence: true
end
