class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @coffees = Coffee.all
  end
end
