class ArticlesController < ApplicationController

  def index

    @articles = Article.all

  end

  def index_unpublished

    @article = Article.find_by(published: true)

  end

  def new

    @article = Article.new

  end

  def show

    @article = Article.find(params[:id])

  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to root_path, notice: 'Tip was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
