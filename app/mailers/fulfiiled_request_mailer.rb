# Fulfilled Request Mail Notification
class FulfiiledRequestMailer < ApplicationMailer
  def request_fulfilled
    @request = params[:request]
    @user = params[:request].user
    mail(to: @user.email,
         subject: 'Your Request is Fulfilled') do |format|
           format.html
           format.text
         end
  end
end
