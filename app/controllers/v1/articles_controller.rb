class V1::ArticlesController < ApplicationController

  def index

    if params[:user_id].present?
      @articles = Article.where(user_id: params[:user_id])
    else
      @articles = Article.all
    end
    # @articles = Article.where(user_id: params[:user_id])
    render json: @articles, only: [:name, :author, :body],
    status: :ok
  end

  def show
    @articles = Article.find_by(id: params[:id])
    render json: @articles,
    status: :ok
  end
end
