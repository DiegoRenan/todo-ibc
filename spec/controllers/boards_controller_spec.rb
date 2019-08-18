require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  
  context 'successfully resquet' do

    before do
      @board = create(:board)
    end
    
    it 'to index' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'to show' do
      get :show, params: { id: @board.id }
      expect(response).to have_http_status(200)
    end

    it 'to create' do
      board_params = attributes_for(:board)
      expect {
        post :create, params: { board: board_params }
      }.to change(Board, :count).by(1)
    end

    it 'to update' do
      put :update, params:  { id: @board.id, board: { title: 'Update title' }  }
      board = Board.find(@board.id)
      expect(board.title).to eq('Update title')
    end

    it 'to delete' do
      expect {
        delete :destroy, params: { id: @board.id }
      }.to change(Board, :count).by(-1)
    end
    
  end
  
end
