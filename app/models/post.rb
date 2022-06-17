class Post < ApplicationRecord
  belongs_to :user
  has_one :course
  has_many :course_types, through: :courses
  has_many :course_time_zones, through: :courses
  has_many :course_equipments, through: :courses
  has_many :course_methods, through: :courses
  has_one_attached :image

  accepts_nested_attributes_for :course, allow_destroy: true
end
