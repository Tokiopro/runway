class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #名前は重複しないように一意性を持たせる
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  #自己紹介文は500文字まで
  validates :introduction, length: { maximum: 500 }
  #年齢は整数のみ,桁数は2桁〜３桁       
  validates :age, length: { in: 2..3 }, numericality: { only_integer: true }
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

  #ログイン時に退会しているユーザーでログインできないように制約する
  def active_for_authentication?
    super && (is_deleted == false)
  end

  #ゲストログイン機能のクラスメソッド
  def self.guest
    find_or_create_by!(name: 'ゲストユーザー',
                       email: 'guestda@example.com',
                       sex: 0,
                       age: 25,
                       is_deleted: false) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
