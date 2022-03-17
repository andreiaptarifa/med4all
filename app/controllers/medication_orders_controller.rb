class MedicationOrdersController < ApplicationController
  def index
    @medication_orders = MedicationOrder.where(user_id: current_user.id)

  end

  def new
    @medication_order = MedicationOrder.new
    # @pharmacies = Pharmacy.near('Rua Jericó, 193, São Paulo', 5)
  end

  def create
    @medication_order = MedicationOrder.new(medication_order_params)

    @medication_order.user = current_user
    # @medication = Medication.find(params[:medication_id])
    medication = Medication.find(params[:medication_order][:medication_id])
    @medication_order.medication = medication
    # @medication_order.pharmacy = pharmacy
    @inventories = Inventory.where(medication: medication)
    @pharmacies = @inventories.map { |inventory| inventory.pharmacy }
    @markers = @pharmacies.map do |pharmacy|
      {
        lat: pharmacy.latitude,
        long: pharmacy.longitude,
        info_window: render_to_string(partial: "pharmacies/info_window", locals: { pharmacy: pharmacy }),
        image_url: helpers.asset_url("/assets/images/hospital-icon.png")
      }
    end
    # pharmacy = Pharmacy.find(params[:medication_order][:pharmacy_id])
    pharmacy = @pharmacies[0]
    inventory = Inventory.find_by(medication: medication, pharmacy: pharmacy)
    # @medication_order.pharmacy = pharmacy
    if inventory.units >= @medication_order.units
      if @medication_order.save
        inventory.update!(units: inventory.units -= @medication_order.units)
        redirect_to medication_orders_path, notice: "Você tem 24 horas para retirar seu remédio"
      else
        render :new
      end
    else
      redirect_to medication_orders_path, alert: "Remédio indisponível na quantidade solicitada"
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
