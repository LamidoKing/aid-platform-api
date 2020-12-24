class MessageSerializer < ActiveModel::Serializer
  attributes :id, :message

  belongs_to :sender
  belongs_to :receiver

  attributes :request

  def sender
    object.sender.attributes.except('password_digest', 'created_at', 'updated_at', 'govnt_id')
  end

  def receiver
    object.receiver.attributes.except('password_digest', 'created_at', 'updated_at', 'govnt_id')
  end
end
