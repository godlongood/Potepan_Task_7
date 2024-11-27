class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reserves 	#1ユーザーが1回の予約で1つの部屋を予約する(複数予約可）
  has_many :rooms, through: :reserves 

end
