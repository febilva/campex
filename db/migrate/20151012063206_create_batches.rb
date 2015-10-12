class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.belongs_to :course, index: true, foreign_key: true
      t.string :name
      t.string :code
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
