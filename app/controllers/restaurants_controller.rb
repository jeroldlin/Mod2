class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
    show_map_all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    show_map
    @reservations = Reservation.all
    @reservation = Reservation.new
    @starrings = Starring.all
    # @starring = Starring.new
    @users = @restaurant.users
    @categories = @restaurant.categories
  end

  def owner_portal
    @reservations = Reservation.all
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
    authenticate_rest_owner
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    current_user.restaurants << @restaurant

    Category.find(params[:restaurant][:category_ids]).restaurants << @restaurant

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

    Category.find(params[:restaurant][:category_ids]).restaurants << @restaurant
    
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
    if authenticate_rest_owner
    else
      @restaurant.destroy
      respond_to do |format|
        format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
        format.json { head :no_content }
      end
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

  def authenticate_rest_owner
    if current_user.name != @restaurant.users.first.name
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :address, :phone_number, :category_ids)
    end
end
