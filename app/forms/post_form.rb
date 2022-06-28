class  PostForm
  #通常のモデルのようにバリデーション、form_with等のヘルパーメソッドを使用するためにActiveModel::Modelをincludeする,フォームのクラスをインスタンスとして扱える
    include ActiveModel::Model
  #クラスメソッドattributeに属性名と型を渡すと、attr_accessorと同じように属性が使えるようになる
  #ActiveModel::Attributesをincludeすることで、ActiveRecordのような属性（attribute）を持たせることができます。
    include ActiveModel::AttributeAssignment

    attr_accessor :user_id, :post_id, :name, :article, :image, :distance, :prefecutures, :undulation, :traffic_light, :street_light, :time_zone, :type, :equipment, :method

  with_options presence: true do
    validates :image
    validates :name
    validates :article
    validates :prefecutures
    validates :undulation
    validates :traffic_light
    validates :street_light
    validates :distance
  end

  

  def save
    ActiveRecord::Base.transaction do
      post = Post.create(article: article, user_id: user_id, image: image)
      self.post_id = post.id
      Course.create(post_id: post_id, name: name, distance: distance, prefecutures: prefecutures, undulation: undulation, traffic_light: traffic_light, street_light: street_light)
      CourseType.create(type: [])
      CourseTimeZone.create(time_zone: [])
      CourseEquipment.create(equipment: [])
      CourseMethod.create(method: [])
    end
  end

  def update
    ActiveRecord::Base.transaction do
      post = Post.update(article: article, user_id: user_id, image: image)
      self.post_id = post.id
      Course.update(post_id: post_id, name: name, distance: distance, prefecutures: prefecutures, undulation: undulation, traffic_light: traffic_light, street_light: street_light)
      CourseType.update(type: [])
      CourseTimeZone.update(time_zone: [])
      CourseEquipment.update(equipment: [])
      CourseMethod.update(method: [])
    end
  end

end