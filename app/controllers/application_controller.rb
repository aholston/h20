class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    if !session[:user_id]
      return redirect_to '/'
    else
      if !User.where(id: session[:user_id]).present?
        session[:user_id] = nil
        return redirect_to '/'
      else
        return
      end
    end
  end

  def user_val
    params.require(:user).permit(:first_name, :last_name, :credit_card, :email, :password, :password_confirmation, :address)
  end
end
