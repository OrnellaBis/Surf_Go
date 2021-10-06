class LaunchJob < ApplicationJob
  queue_as :default

  def perform
    puts "-----------------------------------------------------------------------------------------"
    puts "JOB LAUUUUUUUUUUUUUUUUUUUUUUUNCH"
    puts "-----------------------------------------------------------------------------------------"
    spots = Spot.all
    puts "-----------------------------------------------------------------------------------------"
    puts "#{spots.size}"
    puts "-----------------------------------------------------------------------------------------"
    ValidationForecast.destroy_all
    puts "all forecast destroyed"
    puts "updating #{spots.size} spots"
    spots.each do |spot|
      ForecastanianeJob.perform_later(spot)
    end
  end
end
