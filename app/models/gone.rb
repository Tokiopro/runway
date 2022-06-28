class Gone < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #一人のユーザーが一つの投稿に一つしか行きたい！を押せない
  validates :user_id, uniqueness: { scope: :post_id }
end
