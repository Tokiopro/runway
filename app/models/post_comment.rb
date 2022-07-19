class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #コメントは300文字まで
  validates :comment, presence: true, length: { maximum: 300 }
end
