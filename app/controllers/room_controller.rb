class RoomController < ApplicationController

  before_action :set_room, except: [:index, :new, :create]

  def index
    @rooms = Rooms.all 
  end

  def new
    @room = Room.new(room_params)
  end

  def create
  end

  def listing
    
  end

  def pricing
    
  end

  def description
    
  end

  def photo_upload
    
  end

  def amenities
    
  end

  def location
    
  end

  def update
    
  end

  private 
    def set_room
      @room = Room.find(params[:id])
    end 

    def room_params
      params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, :summary, :address, is_tv, :is_kitchen, :is_air, 
      :is_heating, :is_internet, :price, :active)
    end 

   

end
