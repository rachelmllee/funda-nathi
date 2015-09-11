class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user
      courses_path
    else
      rails_admin.dashboard_path
    end
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :get_permission

      protected

          def configure_permitted_parameters
              devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :role) }
              devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :date_of_birth, :phone_no, :role) }
          end

          def get_permission
            @permitted = false
            if current_user
              if current_user.role? 'student'
                user_acc = Account.where(email: current_user.email).first
                
                @permitted = true if user_acc && user_acc.credit && user_acc.credit != 0                             
              else
                @permitted = true
              end              
            end

            @permitted
          end
      
end
