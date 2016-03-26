class UsersController < ApplicationController

  def show
    @reservations = Reservation.all
  end

end