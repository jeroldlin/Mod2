class StarringController < ApplicationController
  before_action :set_starring, only: [:show, :edit, :update, :destroy]

  def new
  end

  def index
    @starring = Starring.all    
  end

  def create
  @starring = Starring.new(reservation_params)

  current_user.starrings << @starring

  respond_to do |format|
      if @starring.save
        format.html { redirect_to restaurant_path(@starring.restaurant_id), notice: 'Starring was successfully created.' }
        format.json { render :show, status: :created, location: @starring }
      else
        format.html { render :new }
        format.json { render json: @starring.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @starring.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_path(@starring.restaurant_id), notice: 'Starring was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_starring
      @starring = Starring.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def starring_params
      params.require(:starring).permit(:requested_date_time, :restaurant_id)
    end
end