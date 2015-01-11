class HomeController < ApplicationController

  def index
  end

  def contact
  	UserMailer.contact_us_email(params[:name],params[:email],params[:phone],params[:text]).deliver_now
  	redirect_to root_path
  end
end
