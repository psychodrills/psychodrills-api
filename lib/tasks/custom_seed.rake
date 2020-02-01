# lib/tasks/custom_seed.rake
desc "This will create new seed file under (db/seeds)"
task :create_seed do
  if ARGV.length == 2
    puts "========Generating seed file (#{ARGV[1]})==========="
    time = Time.new
    date = time.strftime('%Y%m%d')
    time = DateTime.now.strftime("%H%M")
    file_name = date+time+'_'+ARGV[1]
    out_file = File.new("db/seeds/#{file_name}.rb", "w")
    puts "created   db/seeds/#{file_name}"
  end
  exit
end


desc "This will update the data with newly add seed file under (db/seeds)"
task :update_seed => :environment do
  puts "========== Fetching new seeds ================="
  Dir[File.join('db', 'seeds', '*.rb')].each do |filename|
    seed = AllSeed.find_by_file_name(filename.split("/")[2])
    unless seed.present?
      task_name = File.basename(filename, '.rb')
      puts "Seeding #{filename}..."
      begin
        load(filename) if File.exist?(filename)
        AllSeed.create(:file_name => filename.split("/")[2])
      rescue Exception => e
        puts "========== Seeding #{filename} Reverted!============="      
      end
    end
  end
  puts "========== Seed creation completed ============="
  exit
end