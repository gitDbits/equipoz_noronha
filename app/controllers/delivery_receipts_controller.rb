class DeliveryReceiptsController < ApplicationController
  def show
    @contract = Contract.find(params[:id])
  end
end
