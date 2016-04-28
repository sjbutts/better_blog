class CommentsController < ApplicationController
	before_action :set_comment, only: [:edit, :update, :destroy]
  
  def edit

  end

    def create #Creating the actual comment. Create method must include a redirect 
  	@comment = Comment.new(comment_params)
  		respond_to do |format|  #respond is a callback that calls it back after a certain point in it's life cycle
  			if @comment.save
  				format.html {redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Comment was created succesfully."}
  			else
  				format.html {redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Comment failed to post."}
  			end
  		end
  end

  def update
  		respond_to do |format|  #respond is a callback that calls it back after a certain point in it's life cycle
  			if @comment.update(comment_params)
  				format.html {redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Your comment has been updated."}
  			else
  				format.html {render :edit}
  			end
  		end
  end

  def destroy
  		@comment.destroy(comment_params)
  		respond_to do |format|  #respond is a callback that calls it back after a certain point in it's life cycle
  				format.html {redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Blog Post was deleted succesfully."} #redirect to index path	
  		end
  end

  private

  def comment_params
  	params.require(:comment).permit(:author, :comment_entry, :blog_post_id)
  	
  end

  def set_comment
  	@comment = Comment.find(params[:id])
  end

end
