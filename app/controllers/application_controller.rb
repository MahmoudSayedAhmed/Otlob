class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :get_notifications
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :uimage]  )
  end


  def after_sign_in_path_for(resource)
      request.env['omniauth.origin'] || root_path
  end

  def get_notifications
  	@notifications = []
  	if current_user
		@inviteds =  Invited.where(user_id: current_user.id)
		@inviteds.each do |inv|
			@event = Event.find_by invited_id: inv.id
			@notifications.push(@event)
		end
    @notifications = @notifications.last(3)
	end
  end

end
