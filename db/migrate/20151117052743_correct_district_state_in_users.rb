class CorrectDistrictStateInUsers < ActiveRecord::Migration
  def change
    remove_column :users, :district, :string
    remove_column :users, :state, :string
    remove_column :users, :comm_district, :string
    remove_column :users, :comm_state, :string

    add_reference :users, :district, index: true
    add_reference :users, :state, index: true
    add_reference :users, :comm_district, index: true
    add_reference :users, :comm_state, index: true
  end
end
