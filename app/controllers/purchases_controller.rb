class PurchasesController < ApplicationController
  def index
    @purchases = policy_scope(Purchase) # .order(created_at: :desc)
    @coffees = Coffee.all

  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to purchase_path(@purchase)
    else
      render :new
    end
  end

  def purchase_params
    params.require(:purchase).permit(:quantity, :price)
  end
end
