class CreateCourseMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :course_methods do |t|
      t.references :course, null: false, foreign_key: true
      t.integer :method

      t.timestamps
    end
  end
end
