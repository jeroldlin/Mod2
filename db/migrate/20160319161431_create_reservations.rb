class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string	 	:email
      t.datetime 	:requested_date_time
      t.string 		:message
      t.string 		:restaurant_association
    end
  end
end
