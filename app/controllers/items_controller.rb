class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy, :toggle_complete]
  before_action :set_list, only: [:new, :create, :edit, :update, :toggle_complete]
  def new
    @item = Item.new
    authorize @item
    @item.list = @list
  end

  def create
    @item = Item.new(item_params)
    authorize @item
    @item.list = @list
    @item.user = current_user
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
      redirect_to list_path(@list, anchor: "name-#{@item.id}")
    else
      render :edit
    end
  end

  def destroy
    @list = @item.list
    @item.destroy
    redirect_to list_path(@list)
  end

  def toggle_complete
    if @item.complete
      @item.update(complete: false)
    else
      @item.update(complete: true)
    end
    redirect_to list_path(@list, anchor: "name-#{@item.id}")
  end

  private

  def item_params
    params.require(:item).permit(:name, :note, :quantity, :complete)
  end

  def set_item
    @item = Item.find(params[:id])
    authorize @item
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
