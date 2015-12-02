class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.belongs_to :department, index: true, foreign_key: true
      t.belongs_to :designation, index: true, foreign_key: true
      t.string :employee_no

      t.timestamps null: false
    end
  end
end
