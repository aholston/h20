class UsersController < ApplicationController
  def index
    session[:user_id] = nil
  end

  def create
    user = User.create(user_val)
    if user.valid?
      session[:user_id] = user.id
      return redirect_to '/drones'
    end
    flash[:errors] = user.errors.full_messages
    return redirect_to '/'
  end


end
