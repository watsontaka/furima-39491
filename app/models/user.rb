class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name,     format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :last_name,      format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_katakana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_katakana,  format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_day
  end

  validates :password,       format: { with: /\A(?=.?[a-z])(?=.?\d)[a-z\d]+\z/i }
  
end
