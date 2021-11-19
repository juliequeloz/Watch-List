class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def article_params
    params.require(:list).permit(:title, :body, :photo)
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks

  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
