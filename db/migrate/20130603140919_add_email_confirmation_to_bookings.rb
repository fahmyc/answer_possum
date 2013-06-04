class AddEmailConfirmationToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :email_confirmation, :boolean
  end
end
