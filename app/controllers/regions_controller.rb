class RegionsController < ApplicationController
  def create
    @region = Region.new(region_params)
    if @region.save
      redirect_to root_path
    else
      @regions = Region.all
      render :index
    end
  end

  def index
    @region = Region.new
    @regions = Region.all
  end

  def show
    @region = Region.find(params[:id])
    @categories = @region.categories.all
    @category = @region.categories.new
  end

  private

  def region_params
    params.require(:region).permit(:name)
  end
end
