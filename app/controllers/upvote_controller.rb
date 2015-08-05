class UpvoteController < ApplicationController
def create
    @article = Article.find(params[:article_id])
    if @article.upvotes.count == 0
    @upvote = @article.upvotes.create(params[:upvote])
     @upvote.user_id = current_user.id
     @upvote.save
    redirect_to article_path(@article)


else
redirect_to article_path(@article), notice: 'you have already liked.' 
end

  end
  def destroy
  	@article = Article.find(params[:article_id])
  	if @article.upvotes.count > 0
  		
  	
    
    @upvote = @article.upvotes.find_by(params[:user_id])

    @upvote.destroy
 
    redirect_to article_path(@article)
else
	redirect_to article_path(@article), notice: 'you have already unliked.' 
end

  end
end

