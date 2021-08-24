class AddCollumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :air_temperature, :boolean, :default => true #default value
    add_column :users, :cloud_cover, :boolean, :default => true #default value
    add_column :users, :current_direction, :boolean, :default => false
    add_column :users, :current_speed, :boolean, :default => false
    add_column :users, :swell_direction, :boolean, :default => false
    add_column :users, :swell_height, :boolean, :default => false
    add_column :users, :water_temperature, :boolean, :default => false
    add_column :users, :wave_direction, :boolean, :default => false
    add_column :users, :wave_height, :boolean, :default => true #default value
    add_column :users, :wave_period, :boolean, :default => false
    add_column :users, :wind_wave_height, :boolean, :default => false
    add_column :users, :wind_direction, :boolean, :default => false
    add_column :users, :wind_speed, :boolean, :default => false
    add_column :users, :gust, :boolean, :default => false
    add_column :users, :precipitation, :boolean, :default => false
    add_column :users, :UV_index, :boolean, :default => false
  end
end
