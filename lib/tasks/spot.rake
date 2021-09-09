namespace :spot do
  desc "Update all spot's forecast"
  task update_forecast: :environment do
    spots = Spots.all
    ValidationForecast.destroy_all
    puts "all forecast destroyed"
    puts "updating #{spots.size} spots"
    spots.each do |spot|
      ForecastanianeJob.perform_later(spot)
    end
  end
end
