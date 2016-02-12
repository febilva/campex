class AddCeditSystemToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :credit_system, :boolean, default: false
  end
end
