# Volunters Serializer
class VolunterSerializer < ActiveModel::Serializer
  attributes :id, :user, :request, :created_at, :updated_at
end
