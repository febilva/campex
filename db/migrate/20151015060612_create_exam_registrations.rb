class CreateExamRegistrations < ActiveRecord::Migration
  def change
    create_table :exam_registrations do |t|
      t.belongs_to :examination, index: true, foreign_key: true
      t.belongs_to :student, index: true, foreign_key: true
      t.integer :paper_count
      t.float :fees_paid

      t.timestamps null: false
    end
  end
end
