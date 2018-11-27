class CoffeesController < ApplicationController
  def new
    @coffee = Coffee.new
  end

  def create
    @coffee = Coffee.new(coffee_params)
    @coffee.save
    redirect_to coffee_path(@coffee)
  end

  private

  def coffee_params
    params.require(:coffee).permit(:blend_name, :provenance, :machine, :flavour, :intensity, :stock, :price_per_unit)
  end
end
