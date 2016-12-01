class DeliveryReturnsController < ApplicationController
  def show
    @contract = Contract.find(params[:id])
  end

  def new
    @contract = Contract.find(params[:contract_id])
    @delivery_return = DeliveryReturn.new
  end

  def create
    @contract = Contract.find(params[:contract_id])
    @delivery_return = @contract.create_delivery_return(delivery_return_params)

    if @delivery_return.save
      redirect_to delivery_return_contract_path(@contract)
    else
      flash.now[:error] = 'Não foi possivel emitir Recibo Devolução'
      render :new
    end
  end

  private

  def delivery_return_params
    params.require(:delivery_return).permit(:name, :document)
  end
end
