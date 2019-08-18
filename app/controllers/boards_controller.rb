class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update]

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.new
  end

  def edit
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to @board
    else
      render 'new'
    end
  end

  def update
    if @board.update(board_params)
      redirect_to boards_path
    else
      render 'edit'
    end
  end

  private

    def board_params
      params.require(:board).permit(:title)
    end

    def set_board
      @board = Board.find(params[:id])
    end
end
