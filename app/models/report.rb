class Report < ApplicationRecord
  # アソシエーション 1対多
  belongs_to :user
  has_many :comments, dependent: :destroy
  # itemsテーブルのレコードと画像を紐づけるためにhas_one_attachedというメソッドを利用
  has_one_attached :image

  # whereメソッドとLIKE句を用いて検索の処理を追加
  def self.search(search)
    if search != ""
      Report.where('name LIKE(?)', "%#{search}%").order('created_at DESC')
    else
      Report.includes(:user).order('created_at DESC')
    end
  end

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
