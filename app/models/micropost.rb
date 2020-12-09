class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :posted_at, presence: true

  #micropostの返信先、返信元ポストの取得

  #返信元の関連ユーザー全取得
  
end
