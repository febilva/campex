class CreateOptionalPaperEnrollments < ActiveRecord::Migration
  def change
    create_table :optional_paper_enrollments do |t|
      t.belongs_to :batch, index: true, foreign_key: true
      t.belongs_to :student, index: true, foreign_key: true
      t.belongs_to :paper, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
