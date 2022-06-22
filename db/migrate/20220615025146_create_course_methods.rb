class CreateCourseMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :course_methods do |t|
      t.integer :course_id, null: false
      t.integer :method

      t.timestamps
    end
  end
end
