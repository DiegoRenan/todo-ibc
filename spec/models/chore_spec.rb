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

require 'rails_helper'

RSpec.describe Chore, type: :model do
  
  context 'is valid' do
    
    it 'with title and description' do
      chore = create(:chore)
      expect(chore).to be_valid
    end

    it 'without description' do
      chore = create(:chore, description: nil)
      expect(chore).to be_valid
    end

  end

  context 'is invalid' do
    
    it 'without title' do
      chore = build(:chore, title: nil)
      chore.valid?
      expect(chore.errors[:title]).to include("can't be blank")
    end

    it 'title too short' do
      chore = build(:chore, title: 'a')
      chore.valid?
      expect(chore.errors[:title]).to include(/is too short/)
    end

    it 'title too long' do
      title = 'a' * 51
      chore = build(:chore, title: title)
      chore.valid?
      expect(chore.errors[:title]).to include(/is too long/)
    end

  end

  context 'associations' do

    it 'belong_to card' do
      chore = create(:chore)
      expect(chore.card_id?).to be_truthy
    end

  end

end
