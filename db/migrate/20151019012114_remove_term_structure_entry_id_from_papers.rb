class RemoveTermStructureEntryIdFromPapers < ActiveRecord::Migration
  def change
    remove_reference :papers, :term_structure_entry, index: true, foreign_key: true
  end
end
