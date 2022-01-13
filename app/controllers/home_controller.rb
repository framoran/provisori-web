class HomeController < ApplicationController

  before_action :set_default_session

  def index

    if params.has_key?(:a)

      @search_term = params[:a]
      return @articles = Article.search(params[:a]).page(params[:page]).order("created_at DESC")

    end

    if params.has_key?(:q)

      @articles = Article.where("published = true AND group#{params[:q]} = '1'").page(params[:page]).order("created_at DESC")

    else

      @articles = Article.where("published = true").page(params[:page]).order("created_at DESC")

    end

  end

end
