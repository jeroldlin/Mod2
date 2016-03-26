class RestaurantsUsers < ActiveRecord::Migration
  def change
    create_table(:restaurants_users) do |t|
      ## Database authenticatable
      t.integer :restaurant_id,	index: true
      t.integer :user_id, 		index: true
    end
  end
end
