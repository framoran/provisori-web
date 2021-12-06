class CommentsController < ApplicationController
  include RolesHelper

  before_action :set_article
  before_action :authorization_at_least_reg

  def create

    @comment = Comment.new(comment_params)
    @comment.article = @article

    # Needs to be changed: this always sets the User for a Comment to the first
    # User in the database, _not_ the User that POSTed the Comment.
    @comment.user_id = current_user_id
    @comment.save

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
