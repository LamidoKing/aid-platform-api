# Request Serializer
class RequestSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :description, :status, :type_of_request, :latitude, :longitude

  # # def user
  # #   object.user.attributes.except('password_digest', 'created_at', 'updated_at')
  # # end

  # def message
  #   object.message.object
  # end
end
