desc "Update things"
task :cron => :environment do
  if Time.now.hour < 25
    puts "Pulling new content..."
    stream = LifeStream.new
    stream.update
    puts "done."
  end
end
