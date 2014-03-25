module ShopsHelper

  def render_lead_collector
    if user_signed_in?
      render 'lead'
    else
      render 'auth_request'
    end
  end
end
