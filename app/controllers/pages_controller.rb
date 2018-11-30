class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    Average.new.compute_average_all
    if params[:query].present?
      @coffees = Coffee.search_by_machine_and_intensity(params[:query])
    else
      @coffees = Coffee.all
    end
  end

  def knowledge
  end
end
