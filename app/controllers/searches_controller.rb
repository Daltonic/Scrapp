class SearchesController < ApplicationController
  def new
    @rate = Rate.last
    @search = Search.new
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @rate      = Rate.last
    @search = Search.find(params[:id])
  end

  private
  def search_params
    params.require(:search).permit(:keyword, :max_price, :min_price, :brand)
  end

end
