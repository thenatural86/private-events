class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events
    @attended_events = @user.attended_events
  end
end
