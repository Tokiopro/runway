class CreateCourseEquipments < ActiveRecord::Migration[6.1]
  def change
    create_table :course_equipments do |t|
      t.integer :course_id, null: false
      t.integer :equipment

      t.timestamps
    end
  end
end
