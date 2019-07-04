class AddGuestemailToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :guestemail, :string
  end
end
