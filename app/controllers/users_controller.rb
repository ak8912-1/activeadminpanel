class UsersController < InheritedResources::Base
before_action :authenticate_user!

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :role, :email, :password, asset_ids:[],skill_ids:[])
    end

end
