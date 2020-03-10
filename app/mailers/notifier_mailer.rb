class NotifierMailer < ApplicationMailer
	default from: 'no-reply@data-univers.com',
        return_path: 'system@data-univers.com'

	def welcome(recipient)
	@account = recipient
	mail(to: recipient.email_address_with_name,
	    bcc: ["bcc@data-univers.com", "Order Watcher <watcher@data-univers.com>"])
	end
end
