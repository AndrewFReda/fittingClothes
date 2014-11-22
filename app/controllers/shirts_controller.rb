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
      flash[:notice] = 'Successfully created shirt.'
      redirect_to shirts_path
    else
      flash[:alert] = 'Failed to save shirt measurements.'
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
      flash[:notice] = 'Successfully updated shirt measurements.'
      redirect_to shirt_path
    else
      flash[:alert] = 'Failed to update shirt measurements.'
      render edit_shirt_path
    end
  end

  def destroy
    @shirt = Shirt.find params[:id]
    if @shirt.destroy
      flash[:notice] = 'Successfully deleted shirt.'
    else
      flash[:alert] = 'Failed to delete shirt.'
    end
    redirect_to shirts_path
  end


  def new_compare
    @shirt = Shirt.new
  end

  def compare
    @pattern = Shirt.find params[:compare_id]
    @shirt  = Shirt.new shirt_params
  end


  def draw_shirt(canvas, shirt, fill_color = ChunkyPNG::Color::TRANSPARENT)
    length_mod = shirt.length * 5
    chest_mod  = shirt.chest  * 5
    sleeve_mod = shirt.sleeve * 5

    x = 50
    y = 50

    first_pt   = ChunkyPNG.Point(x, y)
    second_pt  = ChunkyPNG.Point(x + chest_mod,                       y)
    third_pt   = ChunkyPNG.Point(x + chest_mod + (0.75 * sleeve_mod), y + (0.10 * length_mod))
    fourth_pt  = ChunkyPNG.Point(x + chest_mod + (0.75 * sleeve_mod), y + (0.33 * length_mod))
    fifth_pt   = ChunkyPNG.Point(x + chest_mod,                       y + (0.33 * length_mod))
    sixth_pt   = ChunkyPNG.Point(x + chest_mod,                       y + length_mod)
    seventh_pt = ChunkyPNG.Point(x,                                   y + length_mod)
    eighth_pt  = ChunkyPNG.Point(x,                                   y + (0.33 *length_mod))
    ninth_pt   = ChunkyPNG.Point(x - (0.75 * sleeve_mod),             y + (0.33 * length_mod))
    tenth_pt   = ChunkyPNG.Point(x - (0.75 * sleeve_mod),             y + (0.10 * length_mod))

    outline = ChunkyPNG.Vector(first_pt, second_pt, third_pt, fourth_pt, fifth_pt, 
                                sixth_pt, seventh_pt, eighth_pt, ninth_pt, tenth_pt)

    canvas.polygon(outline, ChunkyPNG::Color::BLACK, fill_color)
  end

  private
    def shirt_params
      params.require(:shirt).permit(:name, :length, :chest, :sleeve, :user_id)
    end

end
