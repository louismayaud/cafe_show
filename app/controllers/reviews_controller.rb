class ReviewsController < ApplicationController
  def new
    @coffee = Coffee.find(params[:id])
    @review = Review.new
    authorize @review
    authorize @coffee
  end

  def create
    @coffee = Coffee.find(params[:id])
    @review = Review.new(review_params)
    authorize @review
    @review.user = current_user
    @review.coffee = @coffee

    if @review.save
      redirect_to coffee_path(@coffee)
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @review = Review.find(params[:id])
    authorize @review
  end

  def update
    @review = Review.find(params[:id])
    authorize @review

    if @review.update(review_params)
      redirect_to coffee_path(@review.coffee)
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
