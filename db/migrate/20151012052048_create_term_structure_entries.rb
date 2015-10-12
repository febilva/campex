class CreateTermStructureEntries < ActiveRecord::Migration
  def change
    create_table :term_structure_entries do |t|
      t.belongs_to :term_structure, index: true, foreign_key: true
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
