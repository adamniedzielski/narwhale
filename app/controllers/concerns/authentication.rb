
module Authentication
  extend ActiveSupport::Concern

  def authenticate_regular_client
    render_authentication_error("regular") unless regular_client?
  end

  def authenticate_admin_client
    render_authentication_error("admin") unless admin_client?
  end

  private

    def render_authentication_error(scope)
      render :json => 
             {:error => "Authentication as #{scope} client failed"}.to_json,
             :status => 500      
    end

    def regular_client?
      admin_client? || provided_key == Rails.application.config.regular_key
    end

    def admin_client?
      provided_key == Rails.application.config.admin_key
    end

    def provided_key
      params[:authentication_key]
    end
end