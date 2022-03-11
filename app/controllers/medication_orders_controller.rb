class MedicationOrdersController < ApplicationController
  def index
    @medication_orders = MedicationOrder.all
  end

  def new
    @medication_order = MedicationOrder.new
  end

  def create
    @medication_order = MedicationOrder.new(medication_order_params)

    # @medication = Medication.find(params[:medication_id])
    # @medication_order.medication = @medication
    # @pharmacy = Pharmacy.find(params[:pharmacy_id])
    # @medication_order.pharmacy = @pharmacy

    # if user type for médico, linkar com um outro id de paciente, por meio de prescription. Else, usar o current_user
    @medication_order.user = current_user

    if @medication_order.save
      redirect_to medication_order_path(@medication_order)
    else
      render 'new'
    end
  end

  def show
    @medication_order = MedicationOrder.find(params[:id])
  end

  private

  def medication_order_params
    params.require(:medication_order).permit(:units, :medication_id, :pharmacy_id)
  end
end
