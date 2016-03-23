class ReservationsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /restaurants
  # GET /restaurants.json
  def index
    @reservations = Reservasion.all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    show_map
    @name = current_user.name
  end

  # GET /restaurants/new
  def new
    @Reservaion = Reservasion.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = current_user.restaurants.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_map
    @map_url_string = "https://maps.googleapis.com/maps/api/staticmap?zoom=13&size=400x400&markers=color:blue%7C" + @restaurant.address.gsub(/\s+/, "+") + "&key="
  end

  def show_map_all
    @allRestAddress = ""
    @restaurants.each do |restaurant|
      @allRestAddress += restaurant.address + "%7C"
    end
    @allRestAddress = @allRestAddress.gsub(/\s+/, "+")
    @map_url_string = "https://maps.googleapis.com/maps/api/staticmap?size=400x400&markers=color:blue%7C" + @allRestAddress + "&key="
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :address, :phone_number)
    end

end
