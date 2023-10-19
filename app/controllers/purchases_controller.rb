class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_find,only:[:index,:create]
  before_action :move_to_index, only: [:index]
  before_action :sold_out, only: [:index]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchase_address = PurchaseAddress.new
  end

  def new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :region_id, :city, :home_number, :phone_number, :building).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    return unless current_user.id == @item.user_id

    redirect_to root_path
  end

  def sold_out
    return unless @item.purchase.present?

    redirect_to root_path
  end
end
