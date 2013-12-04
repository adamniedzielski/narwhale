class ApplicationController < ActionController::API
  include ActionController::StrongParameters
  include Authentication
end
