class DronesController < ApplicationController
  before_action :authenticate


  def index
    @user = User.find(session[:user_id])
    @recievers = User.where(level: 0)
  end

  def create
    user = User.find(session[:user_id])
    reciever = User.find(params[:id])
    p user.id
    p reciever.id
    Drone.create(sender: user, reciever: reciever)
    return redirect_to '/drones'
  end


end
