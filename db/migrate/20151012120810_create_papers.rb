class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.belongs_to :syllabus, index: true, foreign_key: true
      t.belongs_to :term_structure_entry, index: true, foreign_key: true
      t.belongs_to :paper_type, index: true, foreign_key: true
      t.string :name
      t.string :code
      t.string :study_mode
      t.boolean :exam_required
      t.boolean :optional

      t.timestamps null: false
    end
  end
end
