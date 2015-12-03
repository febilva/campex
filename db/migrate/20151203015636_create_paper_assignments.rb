class CreatePaperAssignments < ActiveRecord::Migration
  def change
    create_table :paper_assignments do |t|
      t.belongs_to :teacher, index: true, foreign_key: true
      t.belongs_to :paper, index: true, foreign_key: true
      t.belongs_to :batch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
