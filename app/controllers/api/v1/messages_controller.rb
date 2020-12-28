# Message Controller
class Api::V1::MessagesController < ApplicationController
  before_action :authorized, only: [:show, :create, :update, :destroy, :index]
  before_action :set_message, only: [:show, :update, :destroy]

  # GET /api/v1/messages
  def index
    @messages = Message.where(sender_id: @current_user.id).or(Message.where(receiver_id: @current_user.id)).order(created_at: :ASC)

    json_response(@messages)
  end

  # GET /api/v1/messages/1
  def show
    json_response(@message)
  end

  # POST /api/v1/messages
  def create
    @sender = @current_user.id
    @message = Message.create!(message_params.merge(sender_id: @sender))
    @chat_id = [@sender, message_params[:receiver_id]].sort.join('')
    @data = ActiveModelSerializers::Adapter::Json.new(
      MessageSerializer.new(@message)
    ).serializable_hash
    ActionCable.server.broadcast("message_channel_#{@chat_id}", @data)

    json_response(@message, :created)
  end

  # PATCH/PUT /api/v1/messages/1
  def update
    @message.update!(message_params)

    json_response(@message)
  end

  # DELETE /api/v1/messages/1
  def destroy
    @message.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def message_params
    params.fetch(:message, {}).permit(:receiver_id, :request_id, :message)
  end
end
