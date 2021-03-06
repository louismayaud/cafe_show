class PurchasesController < ApplicationController
  def index
    Average.new.compute_average_all
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
    @coffee = Coffee.find(params[:coffee_id])
    @purchase = Purchase.new(quantity: 1, coffee: @coffee, user: user)
    authorize @coffee
    # @purchase.user = user
    # @purchase.coffee = coffee

    if @purchase.save
      @coffee.stock -= 1
      @coffee.unit_sold += 1
      @coffee.save
      redirect_to purchases_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:quantity, :price)
  end
end
