class PagesController < ApplicationController
  # require 'rqrcode'

  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
  end

  def donorhome
  end

  def about
  end

end
