class PurchasesController < ApplicationController
  def index
    @purchases = policy_scope(Purchase).order(created_at: :desc)
  end

  def show
    @purchase = Purchase.find(params[:id])
    authorize @purchase
  end

  def new
    @purchase = Purchase.new
    authorize @purchase
    @coffee = Coffee.find(params[:coffee_id])
  end

  def create
    user = current_user
    coffee = Coffee.find(params[:id])
    @purchase = Purchase.new(purchase_params)
    authorize @coffee
    @purchase.user = user
    @purchase.coffee = coffee

    if @purchase.save
      redirect_to purchase_path(@purchase)
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:quantity, :price)
  end
end
