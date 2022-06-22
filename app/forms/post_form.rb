class  PostForm
  #通常のモデルのようにバリデーション、form_with等のヘルパーメソッドを使用するためにActiveModel::Modelをincludeする,フォームのクラスをインスタンスとして扱える
    include ActiveModel::Model
  #クラスメソッドattributeに属性名と型を渡すと、attr_accessorと同じように属性が使えるようになる
  #ActiveModel::Attributesをincludeすることで、ActiveRecordのような属性（attribute）を持たせることができます。
    include ActiveModel::AttributeAssignment

    attr_accessor :user_id, :post_id, :name, :article, :image, :prefecutures, :undulation, :traffic_light, :street_light, :time_zone, :type, :equipment, :method

  with_options presence: true do
    validates :image
    validates :name
    validates :article
    validates :prefecutures
    validates :undulation
    validates :traffic_light
    validates :street_light
  end
#   attribute :user_id, :integer
#   attribute :article, :string
#   attribute :name, :string
#   attribute :prefecutures, :integer
#   attribute :undulation, :integer
#   attribute :traffic_light, :integer
#   attribute :street_light, :integer
#   attribute :course_time_zone, :integer
#   attribute :course_type, :integer
#   attribute :course_equipment, :integer
#   attribute :course_method, :integer
  # attribute :start_latitude, :float
  # attribute :start_longitude, :float
  # attribute :end_latitude, :float
  # attribute :end_longitude, :float

#   def initialize(params)
#     @post = params
#   end

#   def new(params)
#       post.new(params)
#   end

#   def save
#     post = Post.new(@params)
#     post.course.name.build(name: course)
#     post.course.prefecutures.build(prefecutures: course)
#     post.course.undulation.build(undulation: course)
#     post.course.traffic_light.build(traffic_light: course)
#     post.course.street_light.build(street_light: course)
#     post.course_time_zones.build(time_zone: course_time_zone)
#     # post.course_types.build(type: course_type)
#     # post.course_equipments.build(equipment: course_equipment)
#     # post.course_methods.build(method: course_method)
#     post.save
#   end
  def self.display_types
      CourseType.types.map do |key, value|
        OpenStruct.new(key: key, value: value)
      end
  end

  def self.display_time_zones
      CourseTimeZone.time_zones.map do |key, value|
        OpenStruct.new(key: key, value: value)
      end
  end

  def self.display_equipments
      CourseEquipment.equipment.map do |key, value|
        OpenStruct.new(key: key, value: value)
      end
  end

  def self.display_methods
      CourseMethod.methods.map do |key, value|
        OpenStruct.new(key: key, value: value)
      end
  end


  def save
    ActiveRecord::Base.transaction do
      post = Post.create(article: article, user_id: user_id, image: image)
      self.post_id = post.id
      Course.create(post_id: post_id, name: name, prefecutures: prefecutures, undulation: undulation, traffic_light: traffic_light, street_light: street_light)
      CourseType.create(type: [])
      CourseTimeZone.create(time_zone: [])
      CourseEquipment.create(equipment: [])
      CourseMethod.create(method: [])
    end
  end
end