class Post < ApplicationRecord
  belongs_to :user
  has_one :course, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_tag, dependent: :destroy
  has_many :tags, through: :post_tag
  #行きたい！モデルのアソシエーション
  has_many :gos, dependent: :destroy
  #行った！モデルのアソシエーション
  has_many :gones, dependent: :destroy

  has_many :course_types, through: :courses
  has_many :course_time_zones, through: :courses
  has_many :course_equipments, through: :courses
  has_many :course_methods, through: :courses
  has_one_attached :image

  # accepts_nested_attributes_for :course, allow_destroy: true

  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end

  after_create do
    post = Post.find_by(id: id)
    # ハッシュタグを検出
    tags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |tag|
      #　ハッシュタグは先頭の#を外した上で保存
      tag = Tag.find_or_create_by(hashname: tag.downcase.delete('＃'))
      # << は複数のハッシュタグを保存するための記号。配列として保存する。
      post.tags << tag
  end

end

#更新アクション
before_update do
  post = Post.find_by(id: id)
  post.tags.clear
  tags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
  tags.uniq.map do |tag|
    tag = Tag.find_or_create_by(hashname: tag.downcase.delete('＃'))
    post.tags << tag
  end
end

end