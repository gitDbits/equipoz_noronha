class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(customer_params)
    if @customer.save
      redirect_to @customer
    else
      flash.now[:error] = 'Todos os campos devem ser preenchidos.'
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer)
          .permit(:name, :customer_type, :document, :fiscal_number,
                  :legal_name, :contact_name, :phone_number, :email, :address)
  end
end
