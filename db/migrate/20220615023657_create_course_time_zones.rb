class CreateCourseTimeZones < ActiveRecord::Migration[6.1]
  def change
    create_table :course_time_zones do |t|
      t.references :courses, null: false, foreign_key: true
      t.integer :time_zone

      t.timestamps
    end
  end
end
