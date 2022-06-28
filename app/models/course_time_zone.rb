class CourseTimeZone < ApplicationRecord
  belongs_to :course

  enum time_zone: { morning: 0, daytime: 1, evening: 2, night: 3}
end
