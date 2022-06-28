class CourseType < ApplicationRecord
  belongs_to :course

  TYPES = { way: 0, trail: 1, beach: 2, truck: 3}.freeze
  enum type: TYPES

  #typeカラムはrailsがActiveRecordで用意されているため下記が必要
  self.inheritance_column = :_type_disabled
end
