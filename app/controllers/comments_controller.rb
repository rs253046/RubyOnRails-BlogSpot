class CommentsController < ApplicationController


	def index
		@comments =Comment.find(params[:id]).joins(:user) 
		
	end
	def create

    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params[:comment].permit(:name, :body))
 @comment.user_id = current_user.id
     @comment.save
     
    redirect_to article_path(@article)
  end
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
 
    redirect_to article_path(@article)
  end
end
