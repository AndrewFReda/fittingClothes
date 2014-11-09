class ShirtsController < ApplicationController

  def index
    @shirts = Shirt.all
  end

  def new
    @shirt = Shirt.new
  end

  def create
    @shirt = Shirt.new shirt_params
    if @shirt.save
      flash[:notice] = "Successfully created shirt."
      redirect_to shirts_path
    else
      flash[:alert] = "Failed to save shirt measurements."
      render new_shirt_path
    end
  end

  def show
    @shirt = Shirt.find params[:id]
  end

  def edit
    @shirt = Shirt.find params[:id]
  end

  def update
    @shirt = Shirt.find params[:id]
    if @shirt.update shirt_params
      flash[:notice] = "Successfully updated shirt measurements."
      redirect_to shirt_path
    else
      flash[:alert] = "Failed to update shirt measurements."
      render edit_shirt_path
    end
  end

  def destroy
    @shirt = Shirt.find params[:id]
    if @shirt.destroy
      flash[:notice] = "Successfully deleted shirt."
    else
      flash[:alert] = "Failed to delete shirt."
    end
    redirect_to shirts_path
  end


  private
    def shirt_params
      params.require(:shirt).permit(:name, :length, :chest, :sleeve, :user_id)
    end

end
