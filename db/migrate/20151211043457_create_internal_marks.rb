class CreateInternalMarks < ActiveRecord::Migration
  def change
    create_table :internal_marks do |t|
      t.belongs_to :student, index: true, foreign_key: true
      t.belongs_to :term_structure_entry, index: true, foreign_key: true
      t.belongs_to :paper, index: true, foreign_key: true
      t.float :mark
      t.integer :created_by_id

      t.timestamps null: false
    end
  end
end
