class CardsController < ApplicationController
  def index
    @cards = Card.all
    render json: @cards
  end

  def create
    @board = Board.find(params[:board_id])
    @card = @board.cards.create(card_params)
    redirect_to board_path(@board)
  end

  private
  
    def card_params
      params.require(:card).permit(:title)
    end

end
