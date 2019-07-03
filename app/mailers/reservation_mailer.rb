class ReservationMailer < ApplicationMailer

  def send_email_to_guest(guest, room)
    @recipient = guest
    @room = room
    mail(to: @recipient.email, subject: "Your Reservation")
  end

#mailer should have a paypal request with total price of stay. email of guest is obtained from reservation form

end
