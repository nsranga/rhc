class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_retina_id
  	session[:retina_id] 
  end 
end
