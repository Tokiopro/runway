class Gone < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  #一人のユーザーが一つの投稿に一つしか行きたい！を押せない
  validates_uniquness_of :post_id, scope: :user_id
end
