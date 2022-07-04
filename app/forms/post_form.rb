class PostForm
  #通常のモデルのようにバリデーション、form_with等のヘルパーメソッドを使用するためにActiveModel::Modelをincludeする,フォームのクラスをインスタンスとして扱える
  include ActiveModel::Model
  include ActiveModel::Attributes
  #クラスメソッドattributeに属性名と型を渡すと、attr_accessorと同じように属性が使えるようになる
  #ActiveModel::Attributesをincludeすることで、ActiveRecordのような属性（attribute）を持たせることができます。
  include ActiveModel::AttributeAssignment

  # Post
  attribute :post_id, :integer
  attribute :user_id, :integer
  attribute :article, :string
  attribute :hashbody, :string
  attribute :image

  # Course
  attribute :name, :string
  attribute :distance, :decimal
  attribute :prefecutures, :integer
  attribute :undulation, :integer
  attribute :traffic_light, :integer
  attribute :street_light, :integer

  # CourseType
  attribute :type

  # CourseTimeZone
  attribute :time_zone

  # CourseEquipment
  attribute :equipment

  # CourseMethod
  attribute :method

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

  def self.import(post_id)
    post = Post.find(post_id)
    course = post.course
    new(
      post_id: post.id,
      user_id: post.user_id,
      article: post.article,
      hashbody: post.hashbody,
      image: post.image,

      name: course.name,
      distance: course.distance,
      prefecutures: course.prefecutures,
      undulation: course.undulation,
      traffic_light: course.traffic_light,
      street_light: course.street_light,
  
  # [1, 2,  3]
      type: course.course_types.map {|course_type| course_type.type },
  
      time_zone: course.course_time_zones.map {|course_time_zone| course_time_zone.time_zone },
  
      equipment: course.course_equipments.map {|course_equipment| course_equipment.equipment },
  
      method: course.course_methods.map {|course_method| course_method.method },
    )
  end

  def save
    post = Post.new(article: article, user_id: user_id, image: image)

    course = post.build_course(
      name: name,
      distance: distance,
      prefecutures: prefecutures,
      undulation: undulation,
      traffic_light: traffic_light,
      street_light: street_light)

    Hash(type).transform_keys(&:to_i).keys.each do |t|
      course.course_types.build(type: t)
    end

    Hash(time_zone).transform_keys(&:to_i).keys.each do |tz|
      course.course_time_zones.build(time_zone: tz)
    end

    Hash(equipment).transform_keys(&:to_i).keys.each do |eq|
      course.course_equipments.build(equipment: eq)
    end

    Hash(method).transform_keys(&:to_i).keys.each do |m|
      course.course_methods.build(method: m)
    end

    ret_val = post.save
    self.post_id = post.id
    ret_val
  end

end