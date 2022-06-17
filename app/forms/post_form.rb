# class  PostForm
#   #通常のモデルのようにバリデーション、form_with等のヘルパーメソッドを使用するためにActiveModel::Modelをincludeする,フォームのクラスをインスタンスとして扱える
#   include ActiveModel::Model
#   #クラスメソッドattributeに属性名と型を渡すと、attr_accessorと同じように属性が使えるようになる
#   #ActiveModel::Attributesをincludeすることで、ActiveRecordのような属性（attribute）を持たせることができます。
#   include ActiveModel::Attributes
#   attribute :user_id, :integer
#   attribute :article, :text
#   attribute :name, :string
#   attribute :prefecutures, :integer
#   attribute :undulation, :integer
#   attribute :traffic_light, :integer
#   attribute :street_light, :integer
#   # attribute :start_latitude, :float
#   # attribute :start_longitude, :float
#   # attribute :end_latitude, :float
#   # attribute :end_longitude, :float

# end