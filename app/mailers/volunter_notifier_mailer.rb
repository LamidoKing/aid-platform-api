# Volunter Request Mail Notification
class VolunterNotifierMailer < ApplicationMailer
  default from: 'notifications@aidplatform.com'
  def volunted_to_request
    @request = params[:request].request
    @user = params[:request].user
    mail(to: @user.email,
         subject: 'New Volunteer') do |format|
           format.html
           format.text
         end
  end
end
