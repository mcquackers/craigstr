class PostsController < ApplicationController
  def create
    region = Region.find(params[:region_id])
    @post = region.posts.new(post_params)
    if @post.save
      redirect to [region, @post]
    else
      redirect_to region
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body).merge({user_id:current_user.id})
  end
end
