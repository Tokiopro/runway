class CourseType < ApplicationRecord
  belongs_to :courses

  TYPES = { way: 0, trail: 1, beach: 2, truck: 3}.freeze
  enum type: TYPES
end
