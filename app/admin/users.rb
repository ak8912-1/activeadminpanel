 ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :role, asset_ids:[], skill_ids:[]

  menu priority: 2
  
  ActiveAdmin.register_page "Achievement" do
    belongs_to :user
    content title: "Achievements" do
      current_user.skills.each do |ach|
        h3 "HELLO"
      end
    end
  end

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :role
    # column :current_sign_in_at
    # column :sign_in_count
    # column :created_at
    actions dropdown: true
  end
  
  filter :email
  filter :first_name
  filter :last_name
  filter :current_sign_in_at
  filter :sign_in_count
  filter :role
  # filter :created_at
  
  # decorate_with UserDecorator
  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :role
      f.input :email
      f.input :password
      # f.input :password_confirmation
      # f.input :asset_ids, as: :selected_list
      f.input :assets, :as => :check_boxes, :collection => @asset_ids
      f.input :skills, :as => :check_boxes, :collection => @skill_ids
    end
    f.actions
  end
  
  show title: :name do
    panel "User Profile" do
      attributes_table_for user do
        row :first_name
        row :last_name
        row :email
        row :role
        # row :assets
      end
    end
  end
  
  sidebar "Assets", only: :show do
      user.assets.each do |asset|
        h5 asset.name
      end
  end

  sidebar "Skills", only: :show do
    user.skills.each do |skill|
      h5 skill.name
    end
  end

  controller do
    def index
      if current_user.admin?
        super
      else
        redirect_to root_path, alert: "Access denied."
      end
    end

    def create
      super
      SendMailJob.perform_in(15.seconds.from_now, @user.id)
    end

  end
end