class HomeController < ApplicationController

  def index

    if params.has_key?(:q)

      @articles = Article.where("published = true AND group#{params[:q]} = true")
    else

      @articles = Article.where("published = true")

    end

  end

end
