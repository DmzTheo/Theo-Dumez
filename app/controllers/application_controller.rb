class ApplicationController < ActionController::Base
	protect_from_forgery
	before_action :add_www_subdomain

	def default_url_options
    	{ host: request.host_with_port }
	end

	private

	def add_www_subdomain
		unless /^www/.match(request.host)
			redirect_to("#{request.protocol}x.com#{request.request_uri}",
			          :status => 301)
		end
	end
end
