class CourseType < ApplicationRecord
  belongs_to :courses

  enum type: { way: 0, trail: 1, beach: 2, truck: 3}
end
