class ApplicationController < ActionController::Base
	include Pundit
	protect_from_forgery with: :exception
	before_action :add_www_subdomain

	before_action :authenticate_user!

	def default_url_options
    	{ host: request.host_with_port }
	end

	# Pundit: white-list approach.
	after_action :verify_authorized, except: :index, unless: :skip_pundit?, if: :devise_controller?
	after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?, if: :devise_controller?

	# Uncomment when you *really understand* Pundit!
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	def user_not_authorized
	  flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action."
	  redirect_to(root_path)
	end

	private

	def add_www_subdomain
		unless /^www/.match(request.host)
			redirect_to("#{request.protocol}x.com#{request.request_uri}",
			          :status => 301)
		end
	end

	def skip_pundit?
    	devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
 	end
end
