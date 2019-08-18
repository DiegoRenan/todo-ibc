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
    
  end
end
