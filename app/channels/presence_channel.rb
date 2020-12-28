# User Status Channel
class PresenceChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'presence_channel'
    online
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    offline
  end

  def online
    current_user.status = 'online'
    current_user.save
    ActionCable.server.broadcast('presence_channel', current_user.status)
  end

  def offline
    current_user.status = 'offline'
    current_user.save

    ActionCable.server.broadcast('presence_channel', current_user.status)
  end
end
