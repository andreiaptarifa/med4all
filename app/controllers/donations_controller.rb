class DonationsController < ApplicationController
  before_action :set_donations, only: [:show]

  def new
    @donation = Donation.new
    @pharmacies = Pharmacy.near('Rua Jericó, 193, São Paulo', 3)
    @markers = @pharmacies.map do |pharmacy|
      {
        lat: pharmacy.latitude,
        long: pharmacy.longitude,
        info_window: render_to_string(partial: "pharmacies/info_window", locals: { pharmacy: pharmacy }),
        image_url: helpers.asset_url("/assets/images/hospital-icon.png")
      }
    end
  end

  def create
    @donation = Donation.new(donations_params)
    @donation.user = current_user
    medication = Medication.find(params[:donation][:medication_id])
    @donation.medication = medication
    pharmacy = Pharmacy.find(params[:donation][:pharmacy_id])
    @donation.pharmacy = pharmacy
    if @donation.save
      if Inventory.find_by(medication: medication, pharmacy: pharmacy)
        raise
        inventory = Inventory.find_by(medication: medication, pharmacy: pharmacy)
        inventory.update!(units: inventory.units += @donation.units)
      else
        Inventory.create(units: @donation.units, medication: medication, pharmacy: pharmacy)
      end
      redirect_to donations_path, notice: "Sua doação foi criada e será encaminhada para #{@donation.pharmacy.pharmacy_name}. Obrigado, sua doação ajuda a salvar vidas!"
      # redirect_to root_path
    else
      render :new
    end
  end

  def index
    @donations = Donation.where(user_id: current_user.id)
  end

  def show
    @donation = Donation.find(params[:id])
  end

  private

  def donations_params
    params.require(:donation).permit(:units, :expiry_date, :pharmacy_id)
  end

  def set_donations
    @donation = Donation.find(params[:id])
  end
end
