class CreateCourseEquipments < ActiveRecord::Migration[6.1]
  def change
    create_table :course_equipments do |t|
      t.references :courses, null: false, foreign_key: true
      t.integer :equipment

      t.timestamps
    end
  end
end
