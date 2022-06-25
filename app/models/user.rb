class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum sex: { male: 0, female: 1, others: 2}
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  #行きたい！モデルのアソシエーション
  has_many :gos, dependent: :destroy
  #行った！モデルのアソシエーション
  has_many :gones, dependent: :destroy
  #ボタン条件分岐
  def god_by?(post_id)
    gos.where(post_id: post_id).exists?
  end

  def goned_by?(post_id)
    gones.where(post_id: post_id).exists?
  end

  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/user_no_image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'user_no_image.jpeg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
