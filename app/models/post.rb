class Post < ApplicationRecord
  belongs_to :user
  has_one :course
  has_one_attached :image
  
  accepts_nested_attributes_for :course, allow_destroy: true
end
