class ElementsController < ApplicationController

  before_action :set_article, only: [:index, :new, :edit, :create, :update]

  before_action :authorization_admin

  def create

    element = Element.new element_params
    article = Article.find (params[:article_id])
    element.article = article
    element.save

  end

  def destroy

    @element = Element.find(params[:id])
    @article = @element.article_id

    @element.destroy

    redirect_to(edit_article_path(@article))

  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def element_params
      params.require(:article).permit(:imgart, :elements_type, :subtitle1, :subtitle2, :body, :src, :alt)
    end

    def set_article
      @article = Article.find(params[:article_id])
    end

end
