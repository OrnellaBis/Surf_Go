class AddCollumToForecasts < ActiveRecord::Migration[6.0]
  def change
    add_reference :forecasts, :spot, null: false, foreign_key: true
  end
end
