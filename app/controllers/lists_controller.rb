class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy, :new_list_email]
  def index
    @lists = policy_scope(List).order(created_at: :desc)
  end

  def shows
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = List.new(list_params)
    authorize @list
    @list.user = current_user
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  def new_list_email
    @user = current_user
    @email = params[:email]

    UserMailer.list_send(@list, @user, @email).deliver_now
    flash[:notice] = "List has been sent."
    redirect_to list_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name, :complete)
  end

  def set_list
    @list = List.find(params[:id])
    authorize @list
  end
end
