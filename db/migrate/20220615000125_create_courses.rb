class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.references :post, null: false, foreign_key: true
      t.string :name,        null: false
      t.float :start_latitude
      t.float :start_longitude
      t.float :end_latitude
      t.float :end_longitude
      t.decimal :distance
      t.integer :prefecutures
      t.integer :undulation
      t.integer :traffic_light
      t.integer :street_light

      t.timestamps
    end
  end
end
