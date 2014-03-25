module ApplicationHelper
  def activeable_link_to(text, path, options = {})
    active = if request.path == path then 'active' end
      content_tag :li, class: active  do
        link_to text, path, options
      end
    end

    def user_nav
      if user_signed_in?
        'signed_in'
      else
        'signed_out'
      end
    end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
