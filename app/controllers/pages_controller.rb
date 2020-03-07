class PagesController < ApplicationController
  def home
  end

  def robots
    respond_to :text
  end
end
