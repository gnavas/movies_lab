class CommentsController < ApplicationController
  def create_movie_comment
    @comment = Comment.new comment_params
    @comment.save
    @movie = @comment.commentable
    redirect_to movie_path(@movie)
   
  end

  def create_actor_comment
    @comment = Comment.new comment_params
    @comment.save
    @actor= @comment.commentable
    redirect_to actor_path(@actor) 
  end

  private 
    def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :content)
    end

end
