class ApplicationController < ActionController::API
  include ActionController::StrongParameters
  include Authentication

  unless Rails.application.config.consider_all_requests_local
    rescue_from StandardError, :with => :render_error
  end
 
  def raise_not_found!
    raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
  end
 
  private

    def render_error(e)
      render :json => 
             { :error => "#{e.class.name} : #{e.message}"}.to_json,
             :status => 500  
    end
end
