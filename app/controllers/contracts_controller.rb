class ContractsController < ApplicationController
  def new
    @contract = Contract.new
    @customer = Customer.all
    @equipment = Equipment.all
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to @contract
    else
      flash.now[:error] = 'Não foi possível emitir o contrato'
      render :new
    end
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def index
    @contracts = Contract.all
  end

  private

  def contract_params
    params.require(:contract)
          .permit(:customer_id, :delivery_address, :rental_period,
                  :total_amount, :discount, { equipment_ids: [] },
                  :contact, :number)
  end
end
