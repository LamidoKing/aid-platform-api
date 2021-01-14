# Request Serializer
class RequestSerializer < ActiveModel::Serializer
  attributes :id, :user, :title, :description, :status, :type_of_request, :latitude, :longitude, :created_at, :republished
  has_many :volunters

  def user
    object.user.attributes.except('password_digest', 'created_at', 'updated_at')
  end
end
