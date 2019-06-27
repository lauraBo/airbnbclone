class Reservation < ApplicationRecord
  enum status: {Waiting: 0, Approved:1, Declined: 2}

  belongs_to :room
  belongs_to :user

end
