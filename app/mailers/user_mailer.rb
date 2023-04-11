class UserMailer < ApplicationMailer
    def welcome
        @user = params[:user]
        mail(to: @user.email, from:"demo6@example.com")
    end
end