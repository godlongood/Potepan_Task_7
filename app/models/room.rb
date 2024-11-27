class Room < ApplicationRecord
    #画像アップロード
    mount_uploader :image, ImgUploader

    has_many :reserves, class_name: 'Reserve'	#1ユーザーが1回の予約で1つの部屋を予約する(複数予約可） class_nameはReserfeで読み込まれエラー発生のため
    has_many :users, through: :reserves #部屋を予約したユーザーを取得
end
