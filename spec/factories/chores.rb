# == Schema Information
#
# Table name: chores
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  card_id     :bigint
#
# Indexes
#
#  index_chores_on_card_id  (card_id)
#
# Foreign Keys
#
#  fk_rails_...  (card_id => cards.id)
#

FactoryBot.define do
  factory :chore do
    title { Faker::Verb.simple_present }
    description { Faker::Lorem.paragraph }
    card
  end
end

