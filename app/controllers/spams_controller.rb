class SpamsController < ApplicationController
  before_action :require_admin, only: [:index]
  def index
    @spams = Post.where(spam: true)
  end
end
