class CoffeesController < ApplicationController
  def new
    @coffee = Coffee.new
  end

  def create
    @coffee = Coffee.new(coffee_params)
    @coffee.save
  end
end
