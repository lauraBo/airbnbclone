class CalendarsController < ApplicationController
before_action :authenticate_user!
include ApplicationHelper

def host
    @rooms = current_user.rooms

    params[:start_date] ||= Date.current.to_s
    params[:room_id] ||= @rooms[0] ? @rooms[0].id : nil

    if params[:q].present?
      params[:start_date] = params[:q][:start_date]
      params[:room_id] = params[:q][:room_id]
    end

     @search = Reservation.ransack(params[:q])

    if params[:room_id]
      @room = Room.find(params[:room_id])
      start_date = Date.parse(params[:start_date])

      first_of_month = (start_date - 1.months).beginning_of_month # => Jun 1
      end_of_month = (start_date + 1.months).end_of_month # => Aug 31

      @events = @room.reservations.joins(:user)
                      .select('reservations.*, users.fullname, users.email')
                      .where('(start_date BETWEEN ? AND ?) AND status <> ?', first_of_month, end_of_month, 2)
      #@events.each{ |e| e.image = avatar_url(e) }
      #@days = Calendar.where("room_id = ? AND day BETWEEN ? AND ?", params[:room_id], first_of_month, end_of_month)
    else
      @room = nil
      @events = []
      #@days = []
    end
  end

  private
    def calendar_params
      params.require(:calendar).permit([:price, :status, :start_date, :end_date])
    end
end