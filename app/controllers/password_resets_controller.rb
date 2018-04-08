class PasswordResetsController < ApplicationController
    before_action :get_admin,   only: [:edit, :update]
  before_action :valid_admin, only: [:edit, :update]

  def new
  end

  def create
    @admin = Admin.find_by(email: params[:password_reset][:email].downcase)
    if @admin
      @admin.create_reset_digest
      @admin.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:notice] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

    private

    def get_admin
      @admin = admin.find_by(email: params[:email])
    end

    # Confirms a valid admin.
    def valid_admin
      unless (@admin && @admin.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end
end
