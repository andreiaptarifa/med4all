class PharmaciesController < ApplicationController

  def index
    @pharmacies = Pharmacy.all
    @markers = @pharmacies.geocoded.map do |pharmacy|
      {
        lat: pharmacy.latitude,
        long: pharmacy.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pharmacy: pharmacy })
        # image_url: helpers.asset_url("/assets/images/hospital-icon.png")
      }
    end
  end
end
