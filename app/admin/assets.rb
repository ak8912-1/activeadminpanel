ActiveAdmin.register Asset do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :condition
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    column :id
    column :name
    # column :condition do |asset|
    #   link_to asset.condition ? "New" : "Old",
    #   toggle_condition_admin_asset_path(asset)
    # end

    toggle_bool_column :condition, collection: ["New","Old"]

    actions dropdown: true
  end

  show do
    panel "Asset Info." do
      attributes_table_for asset do
        row :name
        row :condition do
          if asset.condition?
            status_tag("New")
          else
            status_tag("Old")
          end
        end
      end
    end
  end

  # member_action :toggle_condition, method: :get do
  #   asset = Asset.find(params[:id])
  #   asset.update(condition: !asset.condition)
  #   redirect_to collection_path, notice: "Condition was updated!"
  # end

  filter :user
  filter :name
  filter :condition

  form do |f|
    f.inputs do
      f.input :name
      f.input :condition,:as => :radio
    end
    f.actions
  end
end 