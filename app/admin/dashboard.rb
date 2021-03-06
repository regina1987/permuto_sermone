ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
     columns do
        panel "Basic info" do
         panel "Users" do
           ul do
            li "Usuarios registrados: #{User.count}"
           end
          end
          panel "Messages" do
            ul do
             li "Messages: #{Message.count}"
            end
           end
         end
       end
  panel "Lenguas nativos" do
    render 'shared/chart'
  end
  
  end # content
end
