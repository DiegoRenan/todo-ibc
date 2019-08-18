# == Schema Information
#
# Table name: cards
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint
#
# Indexes
#
#  index_cards_on_board_id  (board_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#

FactoryBot.define do
  factory :card do
    
    transient do
      qtd_chores 3
    end
    
    sequence(:title) { |n| "Card - #{n}" }
    
    board

    trait :with_chores do
      after(:create) do |card, evaluator|
        create_list(:chore, evaluator.qtd_chores, card: card)
      end
    end

  end
end
