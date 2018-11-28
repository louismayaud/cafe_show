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

  def purchase_params
    params.require(:purchase).permit(:quantity, :price)
  end

  def incr_quantity
    @item = Item.find(params[:id])
    # I'd probably move the increment logic into the model
    @item.quantity += 1
    @item.save
    # respond to it however you want
  end

end
