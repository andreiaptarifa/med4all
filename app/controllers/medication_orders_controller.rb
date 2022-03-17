class MedicationOrdersController < ApplicationController
  def index
    @medication_orders = MedicationOrder.where(user_id: current_user.id)

  end

  def new
    @medication_order = MedicationOrder.new
  end

  def create
    @medication_order = MedicationOrder.new(medication_order_params)

    @medication_order.user = current_user
    medication = Medication.find(params[:medication_order][:medication_id])
    @medication_order.medication = medication
    @inventories = Inventory.where(medication: medication)
    @pharmacies = @inventories.map { |inventory| inventory.pharmacy }
    # @address = "#{current_user.street} #{current_user.number}, #{current_user.city}"
    # @pharmacies = Pharmacy.near(@address, 10)
    @markers = @pharmacies.map do |pharmacy|
      {
        lat: pharmacy.latitude,
        long: pharmacy.longitude,
        info_window: render_to_string(partial: "pharmacies/info_window", locals: { pharmacy: pharmacy }),
        image_url: helpers.asset_url("/assets/images/hospital-icon.png")
      }
    end
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
