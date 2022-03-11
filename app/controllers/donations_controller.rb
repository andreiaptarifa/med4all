class DonationsController < ApplicationController



















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
    @donation.user = current_user
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
