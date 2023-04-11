# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: "Home"

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.

    columns do
      column do
        panel "Greetings!" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
    
    columns do
      column do
        panel "Recent Users" do
          ol do
            User.last(5).reverse.map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end
      end

      column do
        panel 'Users ratio by Role' do
          pie_chart User.group(:role).count, colors: ["#636155", "#6662507a"]
          # render partial: "metrics/user_role"
        end
      end
    end
  end
end