class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :town_name
      t.integer :zipcode
      t.integer :longitude
      t.integer :latitude
      t.integer :user_id
    end
  end
end
