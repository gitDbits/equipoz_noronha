class DeliveryReceiptsController < ApplicationController
	def show
    @contract = Contract.find_by(id: params[:id])
  end
end
