class EquipmentController < ApplicationController
  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.create(params_equipment)
    if @equipment.save
      redirect_to @equipment
    else
      flash[:error] = 'Não foi possível cadastrar. \
Todos os campos devem ser preenchidos'
      render :new
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  private

  def params_equipment
    params.require(:equipment)
          .permit(:name, :category, :serial_number,
                  :acquisition_date, :replacement_value,
                  :usage_limit)
  end
end
