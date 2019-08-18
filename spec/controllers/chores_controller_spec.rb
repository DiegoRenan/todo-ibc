require 'rails_helper'

RSpec.describe ChoresController, type: :controller do

  context 'successfully resquet' do
    
    before do
      @chore = create(:chore)
    end

    it 'to create' do
      chore_params = attributes_for(:chore)
      expect {
        post :create, params: { chore: chore_params, card_id: @chore.card_id}
      }.to change(Chore, :count).by(1)
    end


    it 'to update' do
      put :update, params:  { id: @chore.id, chore: { title: 'Update title' }  }
      chore = Chore.find(@chore.id)
      expect(chore.title).to eq('Update title')
    end

    it 'to delete' do
      expect {
        delete :destroy, params: { id: @chore.id }
      }.to change(Chore, :count).by(-1)
    end

  end

end
