namespace :scheduled_tasks do
  desc "This task is called by the Heroku scheduler add-on"
  task :update_data => :environment do
    puts "Cleaning up the DB..."

    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean

    puts "Seeding the DB again.."
    Rake::Task["db:seed"].invoke

    puts "done"
  end
end
