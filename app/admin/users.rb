ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :native, :practico, :photo, :comuna_id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :admin, :provider, :uid
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :native, :practico, :photo, :comuna_id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :admin, :provider, :uid]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :email, :password, :name, :native, :practico, :comuna

  controller do
     def update
       if (params[:user][:password].blank? && params[:user][:password_confirmation].blank?)
         params[:user].delete("password")
         params[:user].delete("password_confirmation")
       end
        super
      end
end

  filter :email, as: :select
  filter :native, as: :select
  filter :practico, as: :select
  filter :created_at, as: :date_range


        index do
      	      column :id
      	      column :email
              column :name
              column :native
              column :practico
              column :comuna
      	      column :created_at
              actions
             end

            form do |f|
              inputs do
              input :email
              input :password
              input :name
              input :native
              input :practico
              input :photo
              end
      		   actions
      	    end
end
