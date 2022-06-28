class CourseEquipment < ApplicationRecord
  belongs_to :course


  enum equipment: { toilet: 0, room: 1, shower: 2, locker: 3, parking: 4}
end
