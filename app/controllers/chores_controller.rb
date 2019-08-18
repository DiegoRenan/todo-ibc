class ChoresController < ApplicationController
  before_action :set_chore, only: [:edit, :update, :destroy]

  def edit
  end

  def create
    @card = Card.find(params[:card_id])
    @chore = @card.chores.create(chore_params)
    
    respond_to do |format|
      format.html { redirect_to @chore, notice: 'User was successfully created.' }
      format.js
    end
  end

  def update
    @card = Card.find(@chore.card_id)
  
    if @chore.update(chore_params)
      redirect_to board_path(@card.board_id)
    else
      render 'edit'
    end
  end

  def destroy
    @card = Card.find(@chore.card_id)

    @chore.destroy
  
    redirect_to board_path(@card.board_id)
  end

  private
    def chore_params
      params.require(:chore).permit(:title, :description)
    end

    def set_chore
      @chore = Chore.find(params[:id])
    end

end
