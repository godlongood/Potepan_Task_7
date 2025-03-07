class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reserves, class_name: 'Reserve'	#1ユーザーが1回の予約で1つの部屋を予約する(複数予約可） class_nameはReserfeで読み込まれエラー発生のため
  has_many :rooms, through: :reserves 

  #必須項目
  validates :name, :email, :password, presence: true

  #管理者判定
  def admin?
    self.admin
  end

  #パスワードと確認用パスワードの一致はdeviseの機能で実装済み
end
