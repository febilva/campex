class CreateTermDates < ActiveRecord::Migration
  def change
    create_table :term_dates do |t|
      t.belongs_to :batch, index: true, foreign_key: true
      t.belongs_to :term_structure_entry, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
