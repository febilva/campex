class CreateRegisteredExamPapers < ActiveRecord::Migration
  def change
    create_table :registered_exam_papers do |t|
      t.belongs_to :exam_registration, index: true, foreign_key: true
      t.belongs_to :paper, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
