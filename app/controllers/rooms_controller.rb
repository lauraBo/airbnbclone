class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_room, except: [:index, :new, :create]

  def index 
    @rooms = current_user.rooms
  end

  def show #public page
  end 

  def new 
    @room = current_user.rooms.build
  end

  def create #private page
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to listing_room_path(@room), notice: "listing saved"
    else
      render :new, notice: "listing not saved. Please fill in all fields" 
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

    def is_authorised
      redirect_to root_path, alert: "You don't have permission" unless current_user.id == @room.user_id
    end

    def room_params
      params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, :summary, :address, is_tv, :is_kitchen, :is_air, 
      :is_heating, :is_internet, :price, :active)
    end 

   

end
