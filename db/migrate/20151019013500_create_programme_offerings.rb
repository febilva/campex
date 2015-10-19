class CreateProgrammeOfferings < ActiveRecord::Migration
  def change
    create_table :programme_offerings do |t|
      t.belongs_to :syllabus, index: true, foreign_key: true
      t.belongs_to :paper, index: true, foreign_key: true
      t.belongs_to :term_structure_entry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
