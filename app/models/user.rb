class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    with_options format:{with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
      validates :family_name
      validates :first_name
    end
    with_options format:{with:/\A[ァ-ヶー－]+\z/} do
      validates :family_name_kana
      validates :first_name_kana
    end
    validates :birthday
  end

  validates :email, uniqueness: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

    has_many :items
    has_many :purchase_managements


end
