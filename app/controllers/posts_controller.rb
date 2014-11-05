class PostsController < ApplicationController
  skip_before_action :require_admin
  def new
    @region = Region.find(params[:region_id])
    @categories = @region.categories.all
    @post = @region.posts.new
    @categories = @region.categories.all
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

  def destroy
    post = Post.find(params[:id])
    if authorized_to_alter(post)
      Post.destroy(params[:id])
    end
    redirect_to root_path
  end

  def update
    post = Post.find(params[:id])
    if authorized_to_alter?(post)
      post.update(post_params)
    end
    redirect_to [post.region, post]
  end

  def show
    @region = Region.find(params[:region_id])
    @post = Post.find(params[:id])
  end

  def edit
    @region = Region.find(params[:region_id])
    @categories = @region.categories.all
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.
      require(:post).
      permit(:title, :body, :spam, category_ids: []).
      merge(user_id: current_user.id)
  end

  def authorized_to_alter?(post)
    current_user.admin?  || current_user.id == post.user.id
  end
end
