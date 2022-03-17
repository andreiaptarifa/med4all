class PagesController < ApplicationController
  # require 'rqrcode'

  skip_before_action :authenticate_user!, only: :home

  def home
  end


  def donorhome
  end
