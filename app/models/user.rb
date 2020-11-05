class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # アソシエーション 1対多
  has_many :reports
  has_many :comments, dependent: :destroy

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'を半角英数字混合で入力してください' }
  validates :nickname, presence: true, length: { maximum: 6 }
end