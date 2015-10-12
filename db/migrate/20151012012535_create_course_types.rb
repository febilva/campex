class CreateCourseTypes < ActiveRecord::Migration
  def change
    create_table :course_types do |t|
      t.belongs_to :department, index: true, foreign_key: true
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
