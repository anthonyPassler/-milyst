class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]
  before_action :set_list, only: [:new, :create, :edit, :update]
  def new
    @item = Item.new
    @item.list = @list
  end

  def create
    @item = Item.new(item_params)
    @item.list = @list
    if @item.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list = @item.list
    @item.destroy
    redirect_to list_path(@list)
  end

  private

  def item_params
    params.require(:item).permit(:name, :note, :quantity, :complete)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
