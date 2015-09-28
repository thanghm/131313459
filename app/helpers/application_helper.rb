module ApplicationHelper
  def resource_name
    :user
    :admin
  end

  def resource
    @resource ||= User.new
    @resource ||= Admin.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
    @devise_mapping ||= Devise.mappings[:admin]
  end

  def is_admin?(user)
    admin_role = Role.find(:first, :conditions => ["name = ?", "admin"])
    return user.roles.include?(admin_role)
  end

end
