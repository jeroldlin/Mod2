class RestaurantsUsers < ActiveRecord::Migration
  def change
    create_table(:restaurants_users) do |t|
      ## Database authenticatable
      t.integer :restaurant_id,	null: false, default: ""
      t.integer :users_id, 		null: false, default: ""
    end
  end
end
