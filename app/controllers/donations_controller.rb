class DonationsController < ApplicationController
  before_action :set_donations, only: [:show]

  def index
    @donations = Donation.where(user_id: params[current_user.id])
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donations_params)
    # @medication = Medication.find(params[:medication_id])
    # @donation.medication = @medication
    @donation.user = current_user
    # @pharmacy = Pharmacy.find(params[:pharmacy_id])
    # @donation.pharmacy = @pharmacy
    if @donation.save
      # redirect_to donation_path(@donation), notice: "Parabéns! Sua doação foi criada e irá para o hospital #{@pharmacy.pharmacy_name}. Muito obrigado pelo seu gesto!"
      raise
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def donations_params
    params.require(:donation).permit(:units, :expiry_date, :medication_id, :pharmacy_id)
  end

  def set_donations
    @donation = Donation.find(params[:id])
  end
end
