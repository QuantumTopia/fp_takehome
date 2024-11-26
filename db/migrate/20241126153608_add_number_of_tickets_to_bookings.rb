class AddNumberOfTicketsToBookings < ActiveRecord::Migration[8.0]
  def change
    add_column :bookings, :number_of_tickets, null: false, :integer
  end
end
