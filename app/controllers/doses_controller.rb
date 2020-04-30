class DosesController < ApplicationController

  def index # GET /doses
    @doses = Dose.all
  end

  def show          # GET /doses/:id
    @dose = Dose.find(params[:id])
  end

  def new           # GET /doses/new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create        # POST /doses
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to dose_path(@dose.id)
    else
      render :new
    end
  end

  private
  def dose_params
    params.require(:dose).permit(:name)
  end
end
