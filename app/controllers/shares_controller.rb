class SharesController < ApplicationController  

  def set_article
    @article = Article.find(params[:article_id])
  end

end
