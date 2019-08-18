# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Board, type: :model do
  context 'is valid' do
    
    it 'title' do
      board = create(:board)
      expect(board).to be_valid
    end

  end

  context 'is invalid' do

    it 'without title' do
      board = build(:board, title: nil)
      board.valid?
      expect(board.errors[:title]).to include("can't be blank")
    end

    it 'title too short' do
      board = build(:board, title: 'a')
      board.valid?
      expect(board.errors[:title]).to include(/is too short/)
    end

    it 'title too long' do
      title = 'a' * 51
      board = build(:board, title: title)
      board.valid?
      expect(board.errors[:title]).to include(/is too long/)
    end

  end

end
