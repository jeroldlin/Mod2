class StarringsController < ApplicationController
  before_action :set_starring, only: [:show, :edit, :update, :destroy]

  def new
  end

  def show
  end

  def index
    @starrings = Starring.all    
  end

  def create
    @starring = Starring.new(starring_params)

    respond_to do |format|
      if @starring.save
        format.js
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
      format.js
      format.json { head :no_content }
    end
  end

  private
    def set_starring
      @starring = Starring.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def starring_params
      params.require(:starring).permit(:user_id, :restaurant_id)
    end
end