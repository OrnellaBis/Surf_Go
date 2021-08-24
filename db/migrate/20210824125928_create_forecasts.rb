class CreateForecasts < ActiveRecord::Migration[6.0]
  def change
    create_table :forecasts do |t|
      t.float :air_temperature
      t.date :time
      t.float :cloud_cover
      t.float :current_direction
      t.float :current_speed
      t.float :swell_direction
      t.float :swell_height
      t.float :water_temperature
      t.float :wave_direction
      t.float :wave_height
      t.float :wave_period
      t.float :wind_wave_height
      t.float :wind_direction
      t.float :wind_speed
      t.float :gust
      t.float :precipitation
      t.float :UV_index

      t.timestamps
    end
  end
end
