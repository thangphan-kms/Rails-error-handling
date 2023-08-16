class PurchaseOrdersController < ApplicationController
  def index
    @purchase_orders = PurchaseOrder.all
  end

  def show
    @purchase_order = PurchaseOrder.find_by!(id: params[:id])
    render json: { purchase_order: @purchase_order }, status: :ok
  end
end
