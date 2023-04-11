class CreateJoinTableAssetsUsers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :assets, :users do |t|
      # t.index [:asset_id, :user_id]
      # t.index [:user_id, :asset_id]
    end
  end
end
