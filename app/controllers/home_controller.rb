class HomeController < ApplicationController

  def index

    if params.has_key?(:a)

      @search_term = params[:a]
      return @articles = Article.title_contains(params[:a])     

    end

    if params.has_key?(:q)

      @articles = Article.where("published = true AND group#{params[:q]} = '1'")

    else

      @articles = Article.where("published = true")

    end

  end

end
