# class MessagesController < ApplicationController
#   def new
#     flash[:notice] = params[:notice]
#   end

#   def create
#     SendSMS.new(params[:message], params[:number]).call
#     redirect_to(action: 'new', notice: 'SMS enviado')
#   end
# end
