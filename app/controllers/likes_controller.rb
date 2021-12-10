class LikesController < ApplicationController

  def index

  end

  def create

    like = Like.new
    article = Article.find (params[:article_id])

    like.article = article
    like.like = true
    like.user = current_user_id
    like.save

  end

end
