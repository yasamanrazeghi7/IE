class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


  ######yadet nare
  #protect_from_forgery with: :exception
  #before_action :authenticate_user!
 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :require_profile, if: :devise_controller?
 before_action :if_admin

  protected


 
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :brideEmail, :groomEmail, :brideName, :groomName, :aboutUs, :email, :password, :password_confirmation, :remember_me) }
  end

  def require_profile
  	if !current_user.blank?
  		if current_user.profile.blank?
  			@profile = Profile.new();
        @profile.save
        current_user.profile = @profile
  		end
      #redirect_to profile_path(current_user.profile.id);
  	end
  end

  def if_admin
    
  end


  def after_sign_in_path_for(resource)
    if current_user.profile.blank?
        @profile = Profile.new()
        @profile.save
        current_user.profile = @profile
      end
      if current_user.admin
        "/product_groups"
      else
        "/profiles/#{current_user.profile.id}"
      end
  end

  


 def after_sign_up_path_for(resource)
    if current_user.profile.blank?
        @profile = Profile.new();
        @profile.save
        current_user.profile = @profile
    end
   "/profiles/#{current_user.profile.id}"
  end

  def after_sign_out_path_for(resource_or_scope)
      root_path
  end

#  def after_sign_out_path_for(resource_or_scope)
    # If it's admin 
#     if is_admin?(current_user)
#        admin_path
    # Otherwise
#     else
#        root_path
#     end
#  end

  protect_from_forgery

  protected

#  def after_sign_in_path_for(resource)
#    stored_location_for(:user)
#  end

#  private

# def after_sign_out_path_for(resource)
#    stored_location_for(:user) || root_path
#end

end
