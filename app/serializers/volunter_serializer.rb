# Volunters Serializer
class VolunterSerializer < ActiveModel::Serializer
  attributes :id, :user, :request, :created_at, :updated_at

  def user
    object.user.attributes.except('password_digest', 'created_at', 'updated_at')
  end
end
