class CourseTimeZone < ApplicationRecord
  belongs_to :course

  TIME_ZONES = { morning: 0, daytime: 1, evening: 2, night: 3}.freeze
  enum time_zone: TIME_ZONES
end
