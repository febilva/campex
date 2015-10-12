class CreateTermStructures < ActiveRecord::Migration
  def change
    create_table :term_structures do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
