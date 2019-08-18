namespace :dev do
  desc "Setting up development environment"
    
  task setup: :environment do

    puts "Reseting database"
    
    %x(rails db:drop db:create db:migrate)

    puts "Creating boards"

    21.times do |i|
      Board.create!(
        title: Faker::Company.name,
      )
    end

    puts "Boards successfully created"

    puts "Creating Cards"

    10.times do |i|
      Card.create!(
        title: Faker::Verb.simple_present,
        board_id: Board.all.sample.id
      )
    end

    puts "Cards successfully created"

    puts "Creating Chores"

    10.times do |i|
      Chore.create!(
        title: Faker::Verb.simple_present,
        description: Faker::Lorem.paragraph,
        card_id: Card.all.sample.id
      )
    end

    puts "Chores successfully created"

  end
end
