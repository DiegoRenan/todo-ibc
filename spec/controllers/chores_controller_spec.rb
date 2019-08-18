require 'rails_helper'

RSpec.describe ChoresController, type: :controller do

  context 'successfully resquet' do
    
    before do
      @chore = create(:chore)
    end

    it 'to show' do  
      get :show, params: { id: @chore.id, card_id: @chore.card_id }
      expect(response).to have_http_status(200)
    end

    it 'to create' do
      chore_params = attributes_for(:chore)
      expect {
        post :create, params: { chore: chore_params, card_id: @chore.card_id}
      }.to change(Chore, :count).by(1)
    end

  end

end
