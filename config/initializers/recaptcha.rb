Recaptcha.configure do |config|
	config.site_key = ENV["RECAPTCHA_PUBLIC_KEY"]
	# config.secret_key = ENV["RECAPTCHA_PRIVATE_KEY"]
	# config.site_key = ENV["RECAPTCHA_LOCAL_PUBLIC_KEY"]
	# config.secret_key = ENV["RECAPTCHA_LOCAL_PRIVATE_KEY"]
end