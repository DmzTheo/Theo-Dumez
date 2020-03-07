class SitemapsController < ApplicationController
	layout :nil
	before_action :init_sitemap

	def index
		respond_to do |format|
		 	format.xml
		end
	end

	private

	def init_sitemap
		headers['Content-Type'] = 'text/xml'
	end
end
