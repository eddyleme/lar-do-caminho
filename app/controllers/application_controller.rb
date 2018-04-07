class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

	def require_logged_in
		return true if current_user
		return redirect_to root_path
	end
  def current_cart
   session[:cart_id] ||= Cart.create!.id
   @current_cart ||= Cart.find(session[:cart_id])
  end
end
