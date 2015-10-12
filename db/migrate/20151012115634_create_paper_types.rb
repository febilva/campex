class CreatePaperTypes < ActiveRecord::Migration
  def change
    create_table :paper_types do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
