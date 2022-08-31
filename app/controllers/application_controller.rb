class ApplicationController < ActionController::Base

before_action :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?

# private

 def after_sign_in_path_for(resource)
 	# binding.pry
 	u=current_user
 	# binding.pry
	# current_user.roles.destroy_all
	# binding.pry
	role = Role.find_by(field: params[:user][:roles])
	# binding.pry
	current_user.roles << role if role !=nil
	if current_user.roles.first.field == 'customer'
		return bookings_path
	elsif current_user.roles.first.field== 'property owner'
		return properties_path
	end
end



protected
  def configure_permitted_parameters
  	
   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:fullname, :email, :password, :accno, :phoneno,:avatar)}

   devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:fullname, :email, :password, :accno, :phoneno ,:current_password)}
  end
end
