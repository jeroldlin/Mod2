class RestaurantsOwners < ActiveRecord::Migration
  def change
    create_table(:RestaurantsOwners) do |t|
      ## Database authenticatable
      t.integer :restaurant_id,	null: false, default: ""
      t.integer :owners_id, 	null: false, default: ""
    end
  end
end
