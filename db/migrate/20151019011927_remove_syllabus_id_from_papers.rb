class RemoveSyllabusIdFromPapers < ActiveRecord::Migration
  def change
    remove_reference :papers, :syllabus, index: true, foreign_key: true
  end
end
