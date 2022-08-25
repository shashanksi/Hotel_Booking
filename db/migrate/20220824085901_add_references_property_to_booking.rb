class AddReferencesPropertyToBooking < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :property, null: false, foreign_key: true
  end
end
