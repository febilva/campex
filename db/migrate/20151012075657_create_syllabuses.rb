class CreateSyllabuses < ActiveRecord::Migration
  def change
    create_table :syllabuses do |t|
      t.belongs_to :course, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
