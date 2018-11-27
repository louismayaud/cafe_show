class CoffeesController < ApplicationController
  before_action :set_coffee, only: [:show, :update, :destroy]

  def index
    @coffees = Coffee.all
  end

  def show
  end

  def new
    @coffee = Coffee.new
  end

  def create
    @coffee = Coffee.new(coffee_params)
    @coffee.user = current_user
    if @coffee.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @coffee.update(coffee_params)
      redirect_to coffee_path(@coffee)
    else
      render :edit
    end
  end

  def destroy
    @coffee.destroy
    redirect_to coffee_path
  end

  private

  def set_coffee
    @coffee = Coffee.find(params[:id])
  end

  def coffee_params
    params.require(:coffee).permit(:blend_name, :provenance, :machine, :flavour, :intensity, :stock, :price_per_unit, :tree, :photo)
  end
end
