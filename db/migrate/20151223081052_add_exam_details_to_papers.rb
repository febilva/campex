class AddExamDetailsToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :max_internal_mark, :float
    add_column :papers, :max_external_mark, :float
    add_column :papers, :pass_percent, :integer
  end
end
