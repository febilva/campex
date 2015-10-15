class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :profile, polymorphic: true, index: true
  end
end
