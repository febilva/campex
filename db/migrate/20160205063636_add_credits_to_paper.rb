class AddCreditsToPaper < ActiveRecord::Migration
  def change
    add_column :papers, :credits, :integer
  end
end
