class Tag < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :posts. dependent: :destroy
  validates :name. presence: true
end
