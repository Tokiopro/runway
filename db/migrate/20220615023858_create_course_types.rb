class CreateCourseTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :course_types do |t|
      t.integer :course_id, null: false
      t.integer :type

      t.timestamps
    end
  end
end
