class ArticlesController < ApplicationController

  before_action :authorization_admin, only: [:index, :new, :edit, :create, :update, :destroy]

  def index

    @articles = Article.where("published = false").page(params[:page])

  end

  def new

    @article = Article.new

  end

  def show

    @article = Article.find(params[:id])

  end

  def edit

    @article = Article.find(params[:id])

  end

  def create

    @article = Article.new(article_params)
    @article.published = false

    respond_to do |format|
      if @article.save
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to edit_article_path(@article)}

      else
        format.html { render :new }
      end
    end
  end

  def update

    @article = Article.find(params[:id])

    if @article.published == 1

      @article.update(published: false)

      redirect_to articles_path

    else

      @article.update(published: true)
      redirect_to root_path

    end


  end

  def destroy

    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path

  end

  def like

    @article = Article.find(params[:id])
    Like.create(user_id: current_user_id, article_id:@article.id, like: true)
    redirect_to article_path(@article)

  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :group1, :group2, :group3, :group4, :group5, :group6)
  end

end
