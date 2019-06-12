class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :address
      t.string :cuisine

      t.timestamps
    end
  end
end
