class ReservationsController < ApplicationController
    before_action :authenticate_user! # will need to remove this as guests will not be required
    # to create a user account or sign in
    before_action :set_reservation, only: [:approve, :decline]



    def create
      room = Room.find(params[:room_id])

      if current_user == room.user
        flash[:alert] = "You cannot book your own property!"
      else
        start_date = Date.parse(reservation_params[:start_date])
        end_date = Date.parse(reservation_params[:end_date])
        days = (end_date - start_date).to_i + 1
  

        @reservation = current_user.reservations.build(reservation_params)
        # need to change this from current_user to guest
        @reservation.room = room
        @reservation.price = room.price
        @reservation.total = room.price * days

      #  @reservation.save

      if @reservation.save
        if room.Request?
          flash[:notice] = "Request sent successfully!"   #then send mailer with paypal request with total price
        else
          @reservation.Approved!
          flash[:notice] = "Reservation created successfully!" #then send mailer with paypal request with total price
        end
      else
        flash[:notice] = "Cannot make a reservation at this time!"
      end

      end
      redirect_to room
    end

    def your_trips
      @trips = current_user.reservations.order(start_date: :asc)
      #remove this route as guest will not be a user and not required to sign in. record
      #of trips will be sent via email
    end

    def your_reservations
      @rooms = current_user.rooms

    end

    def approve
    @reservation.Approved!
    redirect_to your_reservations_path
  end

  def decline
    @reservation.Declined!
    redirect_to your_reservations_path
  end

    private

      def set_reservation
        @reservation = Reservation.find(params[:id])
      end

      def reservation_params
        params.require(:reservation).permit(:start_date, :end_date)
        # add guest name , email and phone number to permit?
      end
  end
