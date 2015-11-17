class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :blood_group, :string
    add_column :users, :religion, :string
    add_column :users, :nationality_id, :string
    add_column :users, :mobile_no, :string
    add_column :users, :phone_no, :string
    add_column :users, :address_line1, :string
    add_column :users, :address_line2, :string
    add_column :users, :post_office, :string
    add_column :users, :taluk, :string
    add_column :users, :district, :string
    add_column :users, :state, :string
    add_column :users, :pincode, :string
    add_column :users, :country_id, :string
    add_column :users, :comm_address_line1, :string
    add_column :users, :comm_address_line2, :string
    add_column :users, :comm_post_office, :string
    add_column :users, :comm_taluk, :string
    add_column :users, :comm_district, :string
    add_column :users, :comm_state, :string
    add_column :users, :comm_pincode, :string
    add_column :users, :comm_country_id, :string
  end
end
