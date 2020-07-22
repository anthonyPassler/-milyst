class Api::V1::ListsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  def index
    @lists = policy_scope(List).order(created_at: :desc)
  end

  def show
    @list = List.find(params[:id])
    authorize @list
  end
end
