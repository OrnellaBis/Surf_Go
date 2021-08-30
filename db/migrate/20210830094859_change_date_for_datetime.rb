class ChangeDateForDatetime < ActiveRecord::Migration[6.0]
  def change
    change_column :forecasts, :time, :datetime
  end
end
