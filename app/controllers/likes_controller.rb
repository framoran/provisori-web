class LikesController < ApplicationController

  def index

  end

  def create

  end

  def set_article
    @article = Article.find(params[:article_id])
  end

end
