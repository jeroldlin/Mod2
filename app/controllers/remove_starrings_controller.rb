class RemoveStarringsController < ApplicationController

  def destroy
    # @user_id = current_user.id
    # @restaurant_id = RemoveStarring.find_by_id(params[:id])
    # @starrings = Starring.all
    # @starrings.each do |star|
    #   if star.user_id == user_id && star.restaurant_id == restaurant_id
    #     star.destroy
    #   end
    # end
  end

  private
    def starring_params
      params.require(:starring).permit(:user_id, :restaurant_id)
    end
end