namespace :scheduled_tasks do

  desc "Clean database"
  task :seed_data => :environment do
    CreateDailyForecast.new.clean
  end

  desc "Seed database"
  task :seed_data => :environment do
    CreateDailyForecast.new.seed
  end
end
