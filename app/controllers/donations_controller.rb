class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(set_donations)
    if @donation.save
      redirect_to @donation_path
    else
      render 'donations/show'
    end
  end





























  private

  def donations_params
    params.require(:donation).permit(:units, :expiry_date)
  end

  def set_donations
    @donation = Donation.find(params[:id])
  end

end
