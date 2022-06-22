class CreateCourseTimeZones < ActiveRecord::Migration[6.1]
  def change
    create_table :course_time_zones do |t|
      t.integer :course_id, null: false
      t.integer :time_zone

      t.timestamps
    end
  end
end
