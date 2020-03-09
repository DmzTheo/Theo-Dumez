class Contact < MailForm::Base
	attribute :prenom,    :validate => true
	attribute :name,      :validate => true
	attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :phone, :validate => /(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})$\z/i
	attribute :message
	attribute :nickname,  :captcha  => true

	# Declare the e-mail headers. It accepts anything the mail method
	# in ActionMailer accepts.
	def headers
	    {
	    	:subject => "Data-web-univers message",
	    	:to => "dumez.theo.h@gmail.com",
	    	:from => %("#{name}" <#{email}>)
	    }
	end
end
