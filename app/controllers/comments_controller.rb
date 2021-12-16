class CommentsController < ApplicationController

  before_action :authorization_at_least_reg
  before_action :set_article, only: [ :create , :edit, :update ]

  def create

    @comment = Comment.new(comment_params)
    @comment.article = @article

    # Needs to be changed: this always sets the User for a Comment to the first
    # User in the database, _not_ the User that POSTed the Comment.
    @comment.user_id = current_user.id
    @comment.save

    redirect_to article_path(@article.id, anchor: "comment-id#{@comment.id}")

  end

  def destroy

    if can_edit?(@comment)

      @comment = Comment.find(params[:id])
      @article = @comment.article_id
      @comment.destroy

    else

      redirect_to root_path

    end

  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_article
      @article = Article.find(params[:article_id])
    end

end
