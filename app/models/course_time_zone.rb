class CourseTimeZone < ApplicationRecord
  belongs_to :courses
  
  enum sex: { morning: 0, daytime: 1, evening: 2, night: 3}
end
