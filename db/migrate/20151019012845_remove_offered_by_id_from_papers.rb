class RemoveOfferedByIdFromPapers < ActiveRecord::Migration
  def change
    remove_column :papers, :offered_by_id, :integer
  end
end
