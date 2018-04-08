class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

	def require_logged_in
		return true if current_admin
		return redirect_to root_path
	end
end
