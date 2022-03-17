class MedicationOrdersController < ApplicationController
  def index
    @medication_orders = MedicationOrder.where(user_id: current_user.id)
  end

  def new
    @medication_order = MedicationOrder.new
    if params[:medication_id] && params[:units]
      @inventories = Inventory.where(medication: Medication.find(params[:medication_id])).where('units >= ?', params[:units])
      @pharmacies = @inventories.map { |inventory| inventory.pharmacy }
      @markers = @pharmacies.map do |pharmacy|
        {
          lat: pharmacy.latitude,
          long: pharmacy.longitude,
          info_window: render_to_string(partial: "pharmacies/info_window", locals: { pharmacy: pharmacy }),
          image_url: helpers.asset_url("/assets/images/hospital-icon.png")
        }
      end
    end
  end

  def create
    @medication_order = MedicationOrder.new(medication_order_params)
    medication = Medication.find(params[:medication_order][:medication_id])
    units = params[:medication_order][:units]
    pharmacy = Pharmacy.find(params[:medication_order][:pharmacy_id])
    @medication_order.medication = medication
    @medication_order.user = current_user
    @medication_order.units = units
    @medication_order.pharmacy = pharmacy
    if @medication_order.save
      inventory = Inventory.find_by(medication: medication, pharmacy: pharmacy)
      inventory.units -= units.to_i
      inventory.save!
      account_sid = ENV['TWILIO_ACCOUNT_SID']
      auth_token = ENV['TWILIO_AUTH_TOKEN']
      @client = Twilio::REST::Client.new(account_sid, auth_token)
      @client.messages.create(
        from: '+18548423976',
        to: '+5517981537359',
        body: 'Você pode retirar seu remédio!'
      )
      redirect_to medication_orders_path, notice: "Você recebeu um SMS de confirmação no número #{current_user.cellphone} e tem 24 horas para retirar seu remédio"
    else
      render :new
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
