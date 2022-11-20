class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_list, only: [:new, :create] # why ?

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@bookmark)
    else
      render :new, status: :unprocessable_entity
    end
  end

# créer un new bookmark et l'associer à une list hésistante

  def destroy
    @bookmark.destroy
    redirect_to list_path, status: :see_other
    # redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:list_id]) # suppresion liée à la supprésion de list
  end

  def set_list
    @list = List.find(params[:list_id]) # why ?
  end
end
