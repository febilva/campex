class CreateAuthorizationRequests < ActiveRecord::Migration
  def change
    create_table :authorization_requests do |t|
      t.string :request_id
      t.integer :request_user_id
      t.string :request_type
      t.string :request_params
      t.string :request_remarks
      t.integer :approval_user_id
      t.string :approval_date
      t.string :approval_remarks
      t.string :pending_remarks
      t.string :status

      t.timestamps null: false
    end
  end
end
