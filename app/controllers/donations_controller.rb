class DonationsController < ApplicationController













  def index
    @donations = current_user.donations
  end

  def show
    @donation = Donation.find(params[:id])
  end
end
