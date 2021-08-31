class CreateValidationForecasts < ActiveRecord::Migration[6.0]
  def change
    create_table :validation_forecasts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :forecast, null: false, foreign_key: true

      t.timestamps
    end
  end
end
