class MedicationController < ApplicationController
  def index
    if params[:query].present?
      @medications = Medication.search_by_name_or_substance(params[:query])
    end
    @medications = Medication.available
  end
end
