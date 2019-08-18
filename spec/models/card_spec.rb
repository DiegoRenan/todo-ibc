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

require 'rails_helper'

RSpec.describe Card, type: :model do
  
  context 'is valid' do
  
    it 'with title' do
      card = create(:card)
      expect(card).to be_valid
    end
  
  end

  context 'is invalid' do
    
    it 'without title' do
      card = build(:card, title: nil)
      card.valid?
      expect(card.errors[:title]).to include("can't be blank")
    end

    it 'title too short' do
      card = build(:card, title: 'a')
      card.valid?
      expect(card.errors[:title]).to include(/is too short/)
    end

    it 'title too long' do
      title = 'a' * 51
      card = build(:card, title: title)
      card.valid?
      expect(card.errors[:title]).to include(/is too long/)
    end

  end

  context 'associations' do

    it 'belong_to board' do
      card = create(:card)
      expect(card.board_id?).to be_truthy
    end
  
  end

end
