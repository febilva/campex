class AddTermStructureToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :term_structure, index: true, foreign_key: true
  end
end
