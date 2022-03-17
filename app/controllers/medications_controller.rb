class MedicationsController < ApplicationController
  def index
    if params[:query].present?
      @medications = Medication.search_by_name_or_substance(params[:query])
      respond_to do |format|
        format.json {}
      end
    else
      @medications = Medication.all
    end
  end

  def reservation
    if params[:query].present?
      @medications = Medication.search_by_name_or_substance(params[:query])
      @units = params[:units]
      respond_to do |format|
        format.json {}
      end
    else
      @medications = Medication.all
    end
  end
end
