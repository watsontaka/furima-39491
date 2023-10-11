class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :delete]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def delete
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explain, :category_id, :quality_id, :cost_id, :region_id, :period_id, :price,
                                 :user_id).merge(user_id: current_user.id)
  end
end
