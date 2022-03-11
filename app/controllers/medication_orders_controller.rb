class MedicationOrdersController < ApplicationController
  def show
    @medication_order = MedicationOrder.find(params[:id])
  end
end
