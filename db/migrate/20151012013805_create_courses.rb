class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.belongs_to :course_type, index: true, foreign_key: true
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
