class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]

  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :sold_out_item, only: [:edit, :update, :destroy]



  def index
    @items = Item.order("id DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
     else
      render :new
    end
  end

  def show
  end

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  
  private

  def item_params
    params.require(:item).permit(:item_name, :image, :description, :category_id, :state_id, :shipping_charge_id, :prefecture_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


  def move_to_index
    redirect_to root_path unless current_user == @item.user
  end

  def sold_out_item
    redirect_to root_path if @item.purchase_management.present?
   end
end