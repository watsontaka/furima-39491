class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,       presence: true
  validates :first_name,     presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_katakana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day,      presence: true
  
end
