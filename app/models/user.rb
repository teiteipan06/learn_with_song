class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :nationality, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' }
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message:'全角（漢字・ひらがな・カタカナ）文字を使用してください' }
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message:'全角（漢字・ひらがな・カタカナ）文字を使用してください' }
  validates :birthday, presence: true

  has_many :songs
  has_maby :comments
end
