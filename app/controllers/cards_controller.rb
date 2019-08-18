class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update, :destroy]

  def index
    @cards = Card.all
    render json: @cards
  end

  def edit
  end

  def create
    @board = Board.find(params[:board_id])
    @card = @board.cards.create(card_params)
    redirect_to board_path(@board)
  end

  def update
    @board = Board.find(@card.board_id)
  
    if @card.update(card_params)
      redirect_to @board
    else
      render 'edit'
    end
  end

  def destroy
    @board = Board.find(@card.board_id)

    @card.destroy
 
    redirect_to @board
  end

  private
  
    def card_params
      params.require(:card).permit(:title)
    end

    def set_card
      @card = Card.find(params[:id])
    end

end
