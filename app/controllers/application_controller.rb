class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

      def configure_permitted_parameters
          devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :position, :phone_number, :image) }
          devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :position, :phone_number, :image) }
      end
end
