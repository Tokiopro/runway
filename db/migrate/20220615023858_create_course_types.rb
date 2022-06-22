class CreateCourseTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :course_types do |t|
      t.references :course, null: false, foreign_key: true
      t.integer :type

      t.timestamps
    end
  end
end
