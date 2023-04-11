class AddUserIdToAssets < ActiveRecord::Migration[7.0]
  def change
    add_column :assets, :user_id, :integer, array: true, default: []
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
