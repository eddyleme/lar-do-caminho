class SessionsController < ApplicationController
  def new
  end

  def show
  	redirect_to root_path
  end

  def create
    admin = Admin.find_by(email: params[:email])
    if admin && admin.authenticate(params[:password])
      log_in admin
      params[:session][:remember_me] == '1' ? remember(admin) : forget(admin)
      redirect_to root_path
    else
      flash.now[:notice] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private

  def login_params
    params.require(:session).permit(:email, :password)
  end

end
