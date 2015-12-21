class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.belongs_to :registered_exam_paper, index: true, foreign_key: true
      t.float :mark
      t.integer :entered_by_id

      t.timestamps null: false
    end
  end
end
