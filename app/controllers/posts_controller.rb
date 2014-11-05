class PostsController < ApplicationController
  skip_before_action :require_admin
  def new
    @region = Region.find(params[:region_id])
    @categories = @region.categories.all
    @post = @region.posts.new
  end

  def create
    region = Region.find(params[:region_id])
    @post = region.posts.new(post_params)
    if @post.save
      redirect_to [region, @post]
    else
      redirect_to region
    end
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to [post.region, post]
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.
      require(:post).
      permit(:title, :body, :spam, category_ids: []).
      merge(user_id: current_user.id)
  end
end
