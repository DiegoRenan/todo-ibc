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
    title { Faker::Company.name }
  end
end
