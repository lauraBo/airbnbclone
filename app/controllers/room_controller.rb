class RoomController < ApplicationController
  def index
    @rooms = Rooms.all 
  end

  def new
  end

  def create
  end

  def listing
    @room = Room.find(params[:id])
  end

  def pricing
    @room = Room.find(params[:id])
  end

  def description
    @room = Room.find(params[:id])
  end

  def photo_upload
    @room = Room.find(params[:id])
  end

  def amenities
    @room = Room.find(params[:id])
  end

  def location
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
  end
end
