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

  def page_header(text)
    content_for(:page_header) { text.to_s }
  end

  def gravatar_for(user, size = 30, title = user.fullname)
    image_tag gravatar_image_url(user.email, size: size), title: title, class: 'img-rounded'
  end

end
