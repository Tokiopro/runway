class CourseType < ApplicationRecord
  belongs_to :course

  enum type: { way: 0, trail: 1, beach: 2, truck: 3}

  #typeカラムはrailsがActiveRecordで用意されているため下記が必要
  self.inheritance_column = :_type_disabled
end
