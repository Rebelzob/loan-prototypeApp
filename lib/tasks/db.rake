namespace :db do
  desc "Checks if database exists"
  task exists: :environment do
    begin
      ActiveRecord::Base.connection
      puts 1
    rescue ActiveRecord::NoDatabaseError
      puts 0
    end
  end
end
