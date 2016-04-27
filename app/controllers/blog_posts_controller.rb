class BlogPostsController < ApplicationController
	before_action :set_blog_post, only [:show, :update, :destroy] 

  def index
  	@blog_posts = BlogPost.all
  end

  def new #New renders template, it just takes us to the new page. View needs to be created in order for this method to work. 
  	@blog_post = BlogPost.new 
  end

  def edit #Edit renders the edit template
  end

  def show
  end

  def create #Creating the actual blog post. Create method must include a redirect 
  	@blog_post = BlogPost.new(blog_post_params)
  		respond_to do |format|  #respond is a callback that calls it back after a certain point in it's life cycle
  			if @blog_post.save
  				format.html {redirect_to @blog_post, notice: "Blog Post was created succesfully."}
  			else
  				format.html {render :new}
  			end
  		end
  end

  def update
  		respond_to do |format|  #respond is a callback that calls it back after a certain point in it's life cycle
  			if @blog_post.update(blog_post_params)
  				format.html {redirect_to @blog_post, notice: "Blog Post was updated succesfully."}
  			else
  				format.html {render :edit}
  			end
  		end
  end

  def destroy
  		@blog_post.destroy(blog_post_params)
  		respond_to do |format|  #respond is a callback that calls it back after a certain point in it's life cycle
  				format.html {redirect_to blog_posts_url, notice: "Blog Post was deleted succesfully."} #redirect to index path	
  		end
  end

  private

  def blog_post_params
  	params.require(:blog_post).permit(:title, :author,:blog_entry)
  end

  def set_blog_post  #method to know to grab the right blog post for specific needs (show, destroy, update)
  	@blog_post = BlogPost.find(params[:id]) #@blog_post is  set to the blog post primary key
  end
end
