class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :robots, :new, :create]
  skip_after_action :verify_authorized, only: [:home, :robots, :new, :create]

  def home
  end

  def robots
    respond_to :text
  end

  def new
  	@contact = Contact.new
  end

  def create
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
