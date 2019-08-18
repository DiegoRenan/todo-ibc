require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  context 'successfully resquet' do

    before do
      @card = create(:card)
    end
    
    it 'to index' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'to create' do
      card_params = attributes_for(:card)
      expect {
        post :create, params: { card: card_params, board_id: @card.board_id}
      }.to change(Card, :count).by(1)
    end
  
  end

end