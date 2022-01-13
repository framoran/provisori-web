class ArticlesController < ApplicationController

  before_action :authorization_admin, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy, :like]

  before_action :set_default_session

  def index

    @articles = Article.where("published = false").page(params[:page]).order("created_at DESC")

  end

  def show

    @comments = @article.comments.order("created_at DESC")
    @original_url = request.original_url

    session[:url] = @original_url

  end

  def new

    @article = Article.new

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

  def edit

  end

  def update

    if @article.published == true

      @article.update(published: false)

      redirect_to articles_path

    else

      @article.update(published: true)

      redirect_to root_path

    end

  end

  def destroy

    @article.destroy
    redirect_to articles_path

  end


  def like

    # check whether like exists
    @like = Like.where(user_id: current_user.id, article_id: @article.id)

    if @like.present?
      Like.last.destroy
    else
      Like.create(user_id: current_user.id, article_id: @article.id, like: true)
    end

    redirect_to article_path(@article)

  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:alt, :image, :title, :group1, :group2, :group3, :group4, :group5, :group6)
    end

end
