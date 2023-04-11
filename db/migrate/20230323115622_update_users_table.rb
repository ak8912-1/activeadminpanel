class UpdateUsersTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :asset_ids
    add_column :users, :asset, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
