namespace :dev do
  desc "Setting up development environment"
    
  task setup: :environment do

    puts "Reseting database"
    
    %x(rails db:drop db:create db:migrate)

    puts "Creating boards"

    7.times do |i|
      Board.create!(
        title: Faker::Company.name,
      )
    end

    puts "Boards successfully created"

  end
end
