# Serializer For User
class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :status, :created_at, :updated_at

  # def govnt_id
  #   object.govnt_id.service_url if object.govnt_id.attached?
  # end
end
