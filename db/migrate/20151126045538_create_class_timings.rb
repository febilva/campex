class CreateClassTimings < ActiveRecord::Migration
  def change
    create_table :class_timings do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
