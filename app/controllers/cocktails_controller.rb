class CocktailsController < ApplicationController
  def index # GET /cocktails
    @cocktails = Cocktail.all
  end

  def show          # GET /cocktails/:id
    @cocktail = Cocktail.find(params[:id])
  end

  def new           # GET /cocktails/new
    @cocktail = Cocktail.new(params[:cocktail])
  end

  def create        # POST /cocktails
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail.id)
    else
      render :new
    end
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  # def edit          # GET /restaurants/:id/edit
  #   @restaurant = Restaurant.find(params[:id])
  # end

  # def update        # PATCH /restaurants/:id
  #   @restaurant = Restaurant.find(params[:id])
  #   @restaurant.update(params[:restaurant])
  # end

  # def destroy       # DELETE /restaurants/:id
  #   @restaurant = Restaurant.find(params[:id])
  #   @restaurant.destroy

  # no need for app/views/restaurants/destroy.html.erb
  # redirect_to restaurants_path
  # end
end
