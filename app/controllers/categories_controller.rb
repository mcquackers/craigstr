class CategoriesController < ApplicationController
  def create
    region = Region.find(params[:region_id])
    @category = region.categories.new(category_params)
    if @category.save
      redirect_to :back
    else
      @categories = region.categories.all
      redirect_to :back
    end
  end

  def show
    category = Category.find(params[:id])
    @posts = category.posts
    @paginated_posts = @posts.order("title").page(params[:page]).per(3)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
