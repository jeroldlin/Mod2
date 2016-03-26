class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
  @reservation = Reservation.new(reservation_params)

  respond_to do |format|
      if @reservation.save
        format.html { redirect_to restaurant_path(@reservation.restaurant_id), notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_path(@reservation.restaurant_id), notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:email, :requested_date_time, :message, :restaurant_association, :restaurant_id)
    end
end
