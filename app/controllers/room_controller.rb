class RoomController < ApplicationController
  before_action #authenticate user?
  before_action :set_room, except: [:index, :new, :create]

  def index #public page
    @rooms = Rooms.all 
  end

  def show #public page
  end 

  def new #private page
    @room = Room.new(room_params)
  end

  def create #private page
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
    @photos = @room.photos
    
  end

  def amenities
    
  end

  def location
    
  end

  def update #private page
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
