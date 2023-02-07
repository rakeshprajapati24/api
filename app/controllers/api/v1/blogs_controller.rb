class Api::V1::BlogsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @blogs = Blog.all
    render json: @blogs
  end

  def new 
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      render json: @blog
    else
      render error: {error: "Unable to create blog"}, status: 400
    end
  end

  def update
    @blog = Blog.find_by_id(params[:id])
    if @blog.update(blog_params)
      render json: {message: "blog updated successfully"}, status: 200
    else
      render error: {error: "Unable to update blog"}, status: 400
    end
  end

  def destroy
    @blog = Blog.find_by_id(params[:id])
    if @blog.destroy
      render json: {message: "blog Delete Successfully"}, status: 200
    else
      render error: {error: "Unable to update blog"}, status: 400
    end
  end


  private

  def blog_params
    params.require(:blog).permit!
  end
end
