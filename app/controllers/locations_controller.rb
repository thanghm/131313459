class LocationsController < ApplicationController
  def index
    @location = Location.all
  end

  def location
    @location = Location.all
  end

  def create
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to [@location]
    else
      render :new
    end
  end

  def update
  end
  private

  def location_params
    params.require(:location).permit(:location)
  end
end
