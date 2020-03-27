class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def create
    if verify_recaptcha
      render 'show'
    else
    	@contact = Contact.new(params[:contact])
      @contact.request = request
      if @contact.deliver
      	flash.now[:notice] = 'Merci pour votre message ! Nous vous recontacterons au plus vite'
      else
      	flash.now[:error] = "Le message n'a pas pu être envoyé, réactualisez la page puis rééssayez"
      	render :new
      end
    end
  end
end
