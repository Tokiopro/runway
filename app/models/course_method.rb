class CourseMethod < ApplicationRecord
  belongs_to :courses
  
  METHODS = { stroll: 0, walking: 1, running: 2, marathon: 3, dash: 4}.freeze
  enum method: METHODS
end
