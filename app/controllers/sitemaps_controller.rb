class SitemapsController < ApplicationController

	skip_before_action :authenticate_user!, only: [:index]
	skip_after_action :verify_authorized, only: [:index]

	layout :nil

	before_action :init_sitemap

	def index
		respond_to do |format|
		 	format.xml
		end
		@blogs = Blog.all
		authorize @blogs
	end

	private

	def init_sitemap
		headers['Content-Type'] = 'text/xml'
	end
end
