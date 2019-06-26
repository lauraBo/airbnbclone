class DashboardsController < ApplicationController

  def index
    @rooms = current_user.rooms
  end 


end
