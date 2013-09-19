ActiveAdmin.register User do
  actions :index, :edit, :update
  filter :name
  filter :email

  index do
    column :name
    column :email
    column :created_at
    column :last_sign_in_at
    column "Coordinator" do |user|
      user.adminable_groups.any?
    end
    column "No. of groups", :memberships_count
    column :deleted_at
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :username
      f.input :is_admin
    end
    f.buttons  do
      f.button "Deactivate"
    end
    f.actions
  end

  member_action :update, :method => :put do
    user = User.find(params[:id])
    user.name = params[:user][:name]
    user.email = params[:user][:email]
    user.username = params[:user][:username]
    user.is_admin = params[:user][:is_admin]
    user.save
    redirect_to admin_users_url, :notice => "User updated"
  end
  member_action :update, :method => :put do
    user = User.find(params[:id])
    user.deactivate!
    redirect_to admin_users_url, :notice => "User account deactivated"
  end
  
  csv do
    column :id
    column :name
    column :email
    column :created_at
    column :last_sign_in_at
    column "Coordinator" do |user|
      user.adminable_groups.any?
    end
    column :memberships_count
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
