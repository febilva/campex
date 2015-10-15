class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.belongs_to :course, index: true, foreign_key: true
      t.belongs_to :syllabus, index: true, foreign_key: true
      t.belongs_to :term_structure_entry, index: true, foreign_key: true
      t.string :name
      t.string :code
      t.date :registration_open_date
      t.date :registration_close_date
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
