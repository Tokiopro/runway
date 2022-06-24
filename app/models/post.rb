class Post < ApplicationRecord
  belongs_to :user
  has_one :course, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  #行きたい！モデルのアソシエーション
  has_many :gos, dependent: :destroy
  has_many :god_users, through: :gos, sourse: :post
  #行った！モデルのアソシエーション
  has_many :gones, dependent: :destroy
  has_many :goned_users, through: :gones, sourse: :post
  
  has_many :course_types, through: :courses
  has_many :course_time_zones, through: :courses
  has_many :course_equipments, through: :courses
  has_many :course_methods, through: :courses
  has_one_attached :image

  # accepts_nested_attributes_for :course, allow_destroy: true

  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end

end
