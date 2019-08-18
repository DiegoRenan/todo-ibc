# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :board do
    
    transient do
      qtd_cards 3
    end
    
    title { Faker::Company.name }
    
    trait :with_cards do
      after(:create) do |board, evaluator|
        create_list(:card, evaluator.qtd_cards, board: board)
      end
    end

  end
end
