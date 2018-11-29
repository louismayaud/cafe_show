class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if params[:query].present?
      @coffees = Coffee.search_by_machine_and_intensity(params[:query])
    else
      @coffees = Coffee.all
    end
  end
end
