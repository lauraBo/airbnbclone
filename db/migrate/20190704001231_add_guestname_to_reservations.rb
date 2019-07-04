class AddGuestnameToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :guestname, :string
  end
end
