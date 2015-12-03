class CreateTimetableEntries < ActiveRecord::Migration
  def change
    create_table :timetable_entries do |t|
      t.belongs_to :timetable, index: true, foreign_key: true
      t.belongs_to :period, index: true, foreign_key: true
      t.belongs_to :teacher, index: true, foreign_key: true
      t.belongs_to :paper, index: true, foreign_key: true
      t.integer :wday
      t.boolean :default
      t.integer :created_by_id

      t.timestamps null: false
    end
  end
end
