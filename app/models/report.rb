class Report < ApplicationRecord
  # アソシエーション 1対多
  belongs_to :user
  has_many :comments, dependent: :destroy
  # itemsテーブルのレコードと画像を紐づけるためにhas_one_attachedというメソッドを利用
  has_one_attached :image

  # 空の投稿を保存できないように設定
  with_options presence: true do
    validates :date
    validates :image
    validates :name
    validates :purpose
    validates :outcome
    validates :action_plan
  end
end
