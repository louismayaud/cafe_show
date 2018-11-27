class CoffeesController < ApplicationController
  def index
    @coffees = Coffee.all
  end

  def show
    @coffee = Coffee.find(params[:id])
  end

  def new
    @coffee = Coffee.new
  end

  def create
    @coffee = Coffee.new(coffee_params)
    if @coffee.save
      redirect_to coffee_path(@coffee)
    else
      render :new
    end
  end

  def edit
    @coffee = Coffee.find(params[:id])
  end

  def update
    @coffee = Coffee.find(params[:id])
    if @coffee.update(coffee_params)
      redirect_to coffee_path(@coffee)
    else
      render :edit
    end
  end

  def destroy
    @coffee = Coffee.find(params[:id])
    @coffee.destroy
    redirect_to coffee_path
  end
end
