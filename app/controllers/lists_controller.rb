class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy] # dans show et destroy il exécute la methode set

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # si la save est bonne il enregistre et redirige sur la show @list OU tu renvoit à la creation de list

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other # si destroy tu renvois vers la toute la @lists
  end

  private

  def list_params
    params.require(:list).permit(:name) # :photo à ajouter avec les images
  end

  def set_list
    @list = List.find(params[:id])
  end

end
