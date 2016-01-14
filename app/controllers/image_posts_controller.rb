class ImagePostsController < ApplicationController
  before_action :set_image_post, :only => [:edit, :update]

  def new
    @image_post = ImagePost.new
  end

  def edit
  end

  def update
    if @image_post.update(image_post_params)
      redirect_to post_path(@image_post), notice: 'Post Updated!'
    else
      render :edit, alert: 'Error updating post.'
    end
  end

  def create
    @image_post = current_user.image_posts.build(image_post_params)
    if @image_post.save
      redirect_to post_path(@image_post), notice: 'Nice, New Image Posted!'
    else
      render :new, alert: 'Failed to create your post.'
    end
  end

  def image_post_params
    params.require(:image_post).permit(:title, :url)
  end

  def set_image_post
    @image_post = current_user.image_posts.find(params[:id])
  end
end
