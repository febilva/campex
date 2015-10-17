class AddOfferedByIdToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :offered_by_id, :integer
  end
end
