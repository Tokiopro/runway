class CourseMethod < ApplicationRecord
  belongs_to :course

  enum method: { stroll: 0, walking: 1, running: 2, marathon: 3, dash: 4}
end
