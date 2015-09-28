class PositionsController < ApplicationController
  
  def index
    @position = Position.all
  end

  def positions
    @position = Position.all
  end

  def create
    @position = Position.new
  end

  def show
    @position = Position.find(params[:id])
  end

  def edit
    @position = Position.find(params[:id])
  end

  def create
    @position = Position.new(position_params)

    if @position.save
      redirect_to [@position]
    else
      render :new
    end
  end

  def update
  end
  private

  def position_params
    params.require(:position).permit(:position)
  end
end
