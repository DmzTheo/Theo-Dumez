class ServicesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:creation_site_internet, :referencement]
  skip_after_action :verify_authorized, only: [:creation_site_internet, :referencement]

  def creation_site_internet
  end

  def referencement
  end
end
