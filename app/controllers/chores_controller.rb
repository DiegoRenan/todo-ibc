class ChoresController < ApplicationController
  before_action :set_chore, only: [:show]

  def show
  end

  def create
    @card = Card.find(params[:card_id])
    @chore = @card.chores.create(chore_params)
    
    respond_to do |format|
      format.html { redirect_to @chore, notice: 'User was successfully created.' }
      format.js
    end
  end

  private
    def chore_params
      params.require(:chore).permit(:title, :description)
    end

    def set_chore
      @chore = Chore.find(params[:id])
    end

end
