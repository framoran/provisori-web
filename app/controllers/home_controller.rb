class HomeController < ApplicationController

  def index

    if params.has_key?(:q)

      @articles = Article.where("group2 = true")
    else

      @articles = Article.where("published = true")

    end

  end

end
