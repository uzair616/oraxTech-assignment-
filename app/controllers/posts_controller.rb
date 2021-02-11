class PostsController < ApplicationController
 skip_before_action :require_user , only: [:new,:create,:update]
 before_action :set_post,only: [:edit,:update,:destroy,:show]

   def index
     @posts = Post.all
   end

   def new
     @post = Post.new
   end

   def create
     @post = Post.new(post_params)
     @post.user = current_user
     if @post.save
       flash[:notice] = "Post was created successfully"
       redirect_to posts_path
     else
       flash[:alert] = "Something went wrong try again"
       render 'new'
     end
   end

   def show
   end

   def edit
   end

   def update
     @post.update(post_params)
     if @post.update(post_params)
       flash[:notice] = "post was updated successfully"
       redirect_to posts_path
     else
       render 'edit'
     end
   end

   def destroy
     @post.destroy
     flash[:notice] = "Post was deleted"
     redirect_to posts_path
   end

   private

   def set_post
      @post = Post.find(params[:id])
   end

   def post_params
     params.require(:post).permit(:description)
   end
end
