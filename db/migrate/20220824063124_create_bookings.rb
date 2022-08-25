class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :startDate
      t.date :endDate
      t.string :status
      t.integer :price
      t.belongs_to :user,index:false,foreign_key:true
      t.timestamps
    end
  end
end
