class CreateBatchesExaminations < ActiveRecord::Migration
  def change
    create_table :batches_examinations, id: false do |t|
      t.belongs_to :batch, index: true, foreign_key: true
      t.belongs_to :examination, index: true, foreign_key: true
    end
  end
end
