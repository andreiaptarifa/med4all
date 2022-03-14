class MedicationsController < ApplicationController
  def index
    if params[:query].present?
      @medications = Medication.search_by_name_or_substance(params[:query])
    else
      @medications = Medication.all
    end
  end
end
