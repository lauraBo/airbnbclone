class RoomController < ApplicationController

  before_action :set_room, except: [:index, :new, :create]

  def index
    @rooms = Rooms.all 
  end

  def show
  end 

  def new
    @room = Room.new(room_params)
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to listing_room_path(@room), notice: "listing saved"
    else
      render :new, notice: "listing not saved. Please fille in all fields" 
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
    if @room.update(room_params)
      flash[:notice] = "saved"
    else
      flash[:notice] = "oops...didn't save"
    end
    redirect_back(fallback_location: request.referer)
  end 

    
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
