class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @product_purchase = ProductPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @product_purchase = ProductPurchase.new(purchase_params)
    if @product_purchase.valid?
      pay_item
      @product_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:product_purchase).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
