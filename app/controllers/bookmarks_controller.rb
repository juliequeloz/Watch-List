class BookmarksController < ApplicationController

def index
  @bookmarks = Bookmark.all
  @movies = Movie.all
  @lists = List.all
end

def new
  @list = List.find(params[:list_id])
  @bookmark = Bookmark.new
end

def show
  @bookmark = Bookmark.find(params[:id])
end

def create
  @bookmark = Bookmark.new(bookmark_params)
  @list = List.find(params[:list_id])
  @bookmark.list = List.find(params[:list_id])
  @bookmark.save
  redirect_to list_path(@list)
end

private

def bookmark_params
  params.require(:bookmark).permit(:comment, :movie_id, :list_id)
end

end
