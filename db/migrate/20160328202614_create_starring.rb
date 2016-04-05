class CreateStarring < ActiveRecord::Migration
  def change
    create_table :starrings do |t|
      t.datetime :creation_time
      t.integer :user_id
      t.integer :restaurant_id
    end
  end
end
