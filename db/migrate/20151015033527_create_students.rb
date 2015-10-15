class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.belongs_to :batch, index: true, foreign_key: true
      t.string :admission_no
      t.string :roll_no

      t.timestamps null: false
    end
  end
end
